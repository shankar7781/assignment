P0=ParameterKey=ImageIdParameter,ParameterValue="ami-007020fd9c84e18c7"
P1=ParameterKey=InstanceTypeParameter,ParameterValue="t2.small"
P2=ParameterKey=KeyNameParameter,ParameterValue="keypair"
P3=ParameterKey=SecurityGroupIdParameter,ParameterValue="sg-062ccbc75c22a63bd"
P4=ParameterKey=SubnetIdsParameter,ParameterValue="subnet-0ddbac9c67ea67892"
P5=ParameterKey=SaltMasterIpParameter,ParameterValue="172.31.14.212"
P6=ParameterKey=InstanceNameParameter,ParameterValue="app001"

aws cloudformation create-stack \
  --stack-name  ec2 \
  --template-body file://cloud-formation/ec2.yaml \
  --on-failure=DELETE \
  --parameters ${P0} ${P1} ${P2} ${P3} ${P4} ${P5} ${P6} 
