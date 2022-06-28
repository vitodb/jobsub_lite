# generated by jobsub_lite 
# {%if debug is defined %}debug{%endif%}
universe           = vanilla
executable         = samend.sh
arguments          = 

{% set filebase %}{{executable|basename}}{{date}}{{uuid}}cluster.$(Cluster).$(Process){% endset %}
output             = {{filebase}}.out
error              = {{filebase}}.err
log                = {{filebase}}.log
environment        = CLUSTER=$(Cluster);PROCESS=$(Process);CONDOR_TMP={{dir}};BEARER_TOKEN_FILE=.condor_creds/{{group}}.use;CONDOR_EXEC=/tmp;DAGMANJOBID=$(DAGManJobId);GRID_USER={{user}};JOBSUBJOBID=$(CLUSTER).$(PROCESS)@{{schedd}};EXPERIMENT={{group}};{{environment|join(';')}}
rank                  = Mips / 2 + Memory
notification  = Error
+RUN_ON_HEADNODE= True
transfer_executable     = True
rank               = Mips / 2 + Memory
job_lease_duration = 3600
notification       = Never
transfer_error     = True
transfer_executable= True
transfer_output_files=.empty_file
when_to_transfer_output = ON_EXIT_OR_EVICT
{%if    cpu is defined %}request_cpus = {{cpu}}{%endif%}
{%if memory is defined %}request_memory = {{memory}}{%endif%}
{%if   disk is defined %}request_disk = {{disk}}KB{%endif%}
{%if     OS is defined %}+DesiredOS={{OS}}{%endif%}
+JobsubClientDN="{{clientdn}}"
+JobsubClientIpAddress="{{ipaddr}}"
+Owner="{{user}}"
+JobsubServerVersion="{{jobsub_version}}"
+JobsubClientVersion="{{jobsub_version}}"
+JobsubClientKerberosPrincipal="{{kerberosprincipal}}"
+JOB_EXPECTED_MAX_LIFETIME = {{expected_lifetime}}
notify_user = {{email_to}}
+AccountingGroup = "group_{{group}}.{{user}}"
+Jobsub_Group="{{group}}"
+JobsubJobId="$(CLUSTER).$(PROCESS)@{{schedd}}"
+Drain = False
{%if blacklist is defined%}
+Blacklist_Sites = "{{blacklist}}"
{% endif %}
+GeneratedBy ="{{version}} {{schedd}}"
{{resource_provides_quoted|join("\n+DESIRED_")}}
{{lines|join("\n+")}}
requirements  = target.machine =!= MachineAttrMachine1 && target.machine =!= MachineAttrMachine2  && (isUndefined(DesiredOS) || stringListsIntersect(toUpper(DesiredOS),IFOS_installed)) && (stringListsIntersect(toUpper(target.HAS_usage_model), toUpper(my.DESIRED_usage_model))) {%if append_condor_requirements is defined%} && {{append_condor_requirements}} {%endif%}

{% if no_singularity is false %}
+SingularityImage="{{singularity_image}}"
{% endif %}

{% if role is defined and role != 'Analysis' %}
use_oauth_services = {{group}}_{{role}}
{% else %}
use_oauth_services = {{group}}
{% endif %}

queue 1
