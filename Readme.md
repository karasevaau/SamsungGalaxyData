---
title: "Readme"
author: "Anna Karaseva"
date: "02 05 2021"
output: html_document
---

This is a course 'Getting and Cleaning Data' project.

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

Project contains files:

1	README.md

2	CodeBook.md

		- describes the variables, the data, and any transformations or work that is performed to clean up the data

3	run_analysis.R 

		- file with R script that downloads data collected from Samsung Galaxy accelerometers.
	Downloads dataset for project from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
	Script unpacks and produces two datasets - tidydata.txt and tidydata_average.txt

4	tidydata.txt
	
		- tidy data set created by merging training and testing initial data sets and getting only mean and standart deviation measurements

4	tidydata_average.txt 

		- tidy data set with the average of all means and standart deviations variables for each activity and each subject