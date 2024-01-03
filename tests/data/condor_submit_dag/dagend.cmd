# generated by jobsub_lite
# debug
universe           = vanilla
executable         = samend.sh
arguments          =


output             = samend.$(Cluster).$(Process).out
error              = samend.$(Cluster).$(Process).err
log                = samend.$(Cluster).$(Process).log
getenv             = SAM_PROJECT,USER,DN
environment        = CLUSTER=$(Cluster);PROCESS=$(Process);CONDOR_TMP=/home/$ENV(USER)/.cache/jobsub_lite/js_2023_12_18_112255_71a1aea7-4417-446c-920c-d3042a8f2b4b;BEARER_TOKEN_FILE=.condor_creds/fermilab.use;CONDOR_EXEC=/tmp;DAGMANJOBID=$(DAGManJobId);GRID_USER=$ENV(USER);JOBSUBJOBID=$(CLUSTER).$(PROCESS)@jobsubdevgpvm01.fnal.gov;EXPERIMENT=fermilab;EXPERIMENT=samdev;IFDH_DEBUG=1;IFDH_VERSION=v2_6_10;IFDH_TOKEN_ENABLE=1;IFDH_PROXY_ENABLE=0;SAM_EXPERIMENT=samdev;SAM_GROUP=samdev;SAM_STATION=samdev;IFDH_CP_MAXRETRIES=2;VERSION=v1_1;SAM_DATASET=gen_cfg;SAM_USER=$ENV(USER);SAM_PROJECT=$ENV(SAM_PROJECT)
rank                  = Mips / 2 + Memory
notification  = Error
+RUN_ON_HEADNODE= True
transfer_executable     = True
rank               = Mips / 2 + Memory
job_lease_duration = 3600
transfer_error     = True
transfer_executable= True
transfer_output_files=.empty_file
when_to_transfer_output = ON_EXIT_OR_EVICT
request_memory = 100mb

+JobsubClientDN="$ENV(DN)"
+JobsubClientIpAddress="131.225.60.169"
+JobsubServerVersion="jobsub_lite-v1.5"
+JobsubClientVersion="jobsub_lite-v1.5"
+JobsubClientKerberosPrincipal="$ENV(USER)@FNAL.GOV"
+JOB_EXPECTED_MAX_LIFETIME = 7200.0
+AccountingGroup = "group_fermilab.$ENV(USER)"
+Jobsub_Group="fermilab"
+JobsubJobId="$(CLUSTER).$(PROCESS)@jobsubdevgpvm01.fnal.gov"
+JobsubOutputURL="https://fndcadoor.fnal.gov:2880/fermigrid/jobsub/jobs/2023_12_18/71a1aea7-4417-446c-920c-d3042a8f2b4b"
+JobsubUUID="71a1aea7-4417-446c-920c-d3042a8f2b4b"
+Drain = False
# default for remote submits is to keep completed jobs in the queue for 10 days
+LeaveJobInQueue = False

+DESIRED_SITES = ""


+GeneratedBy ="jobsub_lite-v1.5 jobsubdevgpvm01.fnal.gov"

+DESIRED_usage_model = "DEDICATED,OPPORTUNISTIC,OFFSITE"




requirements = target.machine =!= MachineAttrMachine1 && target.machine =!= MachineAttrMachine2 && (isUndefined(DesiredOS) || stringListsIntersect(toUpper(DesiredOS),IFOS_installed)) && (stringListsIntersect(toUpper(target.HAS_usage_model), toUpper(my.DESIRED_usage_model)))


+SingularityImage="/cvmfs/singularity.opensciencegrid.org/fermilab/fnal-wn-sl7:latest"


# Credentials


use_oauth_services = fermilab
fermilab_oauth_permissions_b355f5a23c  = " compute.read compute.create compute.cancel compute.modify storage.read:/fermilab/users/$ENV(USER) storage.create:/fermilab/users/$ENV(USER) storage.create:/fermigrid/jobsub/jobs "



+x509userproxy = "x509up_fermilab_Analysis_$ENV(UID)"
delegate_job_GSI_credentials_lifetime = 0


queue 1
