#!/bin/bash

aws ec2 start-instances --instance-ids $INSTANCE_ID && aws ec2 wait instance-status-ok --instance-ids $INSTANCE_ID
