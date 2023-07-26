#!/bin/bash

# Helm Cheat Sheet

# Basic interpretations/context
# Chart: It is name of your chart in case it has been pulled and untarred. 
# It is <repo_name>/<chart_name> in case the repository has been added but chart not pulled. 
# It is the URL/Absolute path to the chart.
# Name: It is the name you want to give to your current helm chart installation.
# Release: Is the name you assigned to an installation instance.
# Revision: Is the value from the Helm history command
# Repo-name: The name of a repository.
# DIR: Directory name/path

# Chart Management

# Creates a chart directory along with the common files and directories used in a chart.
helm create <name>

# Packages a chart into a versioned chart archive file.
helm package <chart-path>

# Run tests to examine a chart and identify possible issues:
helm lint <chart>

# Inspect a chart and list its contents:
helm show all <chart>

# Displays the contents of the values.yaml file
helm show values <chart>

# Download/pull chart
helm pull <chart>

# If set to true, will untar the chart after downloading it
helm pull <chart> --untar=true

# Verify the package before using it
helm pull <chart> --verify

# Default-latest is used, specify a version constraint for the chart version to use
helm pull <chart> --version <number>

# Display a list of a chart’s dependencies:
helm dependency list <chart>

# Install and Uninstall Apps

# Install the chart with a name
helm install <name> <chart>

# Install the chart in a specific namespace
helm install <name> <chart> --namespace <namespace>

# Set values on the command line (can specify multiple or separate values with commas)
helm install <name> <chart> --set key1=val1,key2=val2

# Install the chart with your specified values
helm install <name> <chart> --values <yaml-file/url>

# Run a test installation to validate chart (p)
helm install <name> <chart> --dry-run --debug

# Verify the package before using it
helm install <name> <chart> --verify

# update dependencies if they are missing before installing the chart
helm install <name> <chart> --dependency-update

# Uninstall a release
helm uninstall <name>

# Perform App Upgrade and Rollback

# Upgrade a release
helm upgrade <release> <chart>

# If set, upgrade process rolls back changes made in case of failed upgrade.
helm upgrade <release> <chart> --atomic

# update dependencies if they are missing before installing the chart
helm upgrade <release> <chart> --dependency-update

# specify a version constraint for the chart version to use
helm upgrade <release> <chart> --version <version_number>

# specify values in a YAML file or a URL (can specify multiple)
helm upgrade <release> <chart> --values 

# Set values on the command line (can specify multiple or separate valuese)
helm upgrade <release> <chart> --set key1=val1,key2=val2

# Force resource updates through a replacement strategy
helm upgrade <release> <chart> --force

# Roll back a release to a specific revision
helm rollback <release> <revision>

# Allow deletion of new resources created in this rollback when rollback fails
helm rollback <release> <revision> --cleanup-on-fail
