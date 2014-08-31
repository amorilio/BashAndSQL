drop table MSC_ENG_PARAMETERS_B;
create table MSC_ENG_PARAMETERS_B  
(
PARAMETER_ID NUMBER(18),
PARAMETER_NAME VARCHAR2(50),
PARAMETER_COL_TYPE NUMBER(1),
PARAMETER_DEF_VALUE_NUM NUMBER(18),
PARAMETER_DEF_VALUE_DATE DATE ,
PARAMETER_DEF_VALUE_STR VARCHAR(1000),
CHANGE_SCALE NUMBER(2), 
EDITABLE NUMBER(1) Not null,
DISPLAY_CATEGORY NUMBER(1) Not null,
DISPLAY_GROUP NUMBER(1) Not null,
CREATED_BY VARCHAR2(64) Not null,
CREATION_DATE DATE Not null,
LAST_UPDATED_BY VARCHAR2(64) Not null,
LAST_UPDATE_DATE DATE Not null,
LAST_UPDATE_LOGIN VARCHAR2(32)
);

INSERT into  MSC_ENG_PARAMETERS_B  values (101, 'SupersessionLevel',1, 1, NULL, NULL, 2, 1, 1, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (102, 'WriteCombinationResults',1, 0, NULL, NULL, 0, 1, 1, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (201, 'EnableFitValidation',1, 1, NULL, NULL,2, 1, 2, 2, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (202, 'FitValidationSensitivity',1, 0.5, NULL, NULL, 2, 1, 2, 2, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (203, 'FitTestPeriod',1, 26, NULL, NULL, 2, 1, 2, 2, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (204, 'DeviationFactor',1, 5, NULL, NULL, 2, 1, 2, 2, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (205, 'StdRatio',1, 3, NULL, NULL, 2, 1, 2, 2, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (206, 'EnableForecastValidation',1, 1, NULL, NULL, 1, 1, 2, 2, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (207, 'ForecastValidationSensitivity',1, 3.5, NULL, NULL, 1, 1, 2, 2, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (208, 'ForecastTestPeriod',1, 26, NULL, NULL, 1, 1, 2, 2, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (209, 'EnableModelValidation',1, 0, NULL, NULL, 2, 1, 2, 2, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (210, 'ModelValidationSensitivity',1, 0.2, NULL, NULL, 2, 1, 2, 2, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (211, 'RemoveResidOutlier',1, 0, NULL, NULL, 2, 1, 2, 2, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (212, 'MetricsPeriod',1, 26, NULL, NULL, 0, 1, 2, 2, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (301, 'DetectOutlier',1, 1, NULL, NULL,2, 1, 3, 3, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (302, 'OutlierSensitivity',1, 2.5, NULL, NULL,2, 1, 3, 3, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (303, 'RemoveExtremeOutlier',1, 1, NULL, NULL,2, 1, 3, 3, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (304, 'OutliersPercent',1, 25, NULL, NULL,2, 1, 3, 3, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (305, 'OutlierStdErr',1, 2.5, NULL, NULL,2, 1, 3, 3, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (306, 'DetectRegimeChange',1, 1, NULL, NULL,2, 1, 3, 3, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (307, 'RegimeSensitivity',1, 5, NULL, NULL,2, 1, 3, 3, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (308, 'MinLengthForDataSmoothing',1, 52, NULL, NULL,2, 1, 3, 3, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (309, 'FillMissingMethod',1, 0, NULL, NULL,2, 1, 3, 3, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (401, 'EnableNonNegRegr',1, 0, NULL, NULL,2, 1, 4, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (402, 'EnableWeightedRegr',1, 0, NULL, NULL,2, 1, 4, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (403, 'EnableNaiveForecast',1, 1, NULL, NULL,2, 1, 4, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (404, 'WriteFit',1, 1, NULL, NULL,2, 1, 4, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (405, 'EnableModifiedVariance',1, 0, NULL, NULL,2, 1, 4, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (406, 'HighestSquaring',1, 4, NULL, NULL,2, 1, 4, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (407, 'NonNegRegrIterations',1, 2, NULL, NULL,2, 1, 4, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (408, 'NumOfShapes',1, 8, NULL, NULL,2, 1, 4, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (409, 'ShapeSign',1, 1, NULL, NULL,2, 1, 4, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (410, 'DampPeriod',1, 0, NULL, NULL,2, 1, 4, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (411, 'DampStep',1, 1, NULL, NULL,2, 1, 4, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (501, 'PeriodsUntilInactive',1, 26, NULL, NULL,3, 1, 5, 5, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (502, 'PeriodsUntilActive',1, 2, NULL, NULL,3, 1, 5, 5, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (503, 'GlobalAllocationPeriods',1, 26, NULL, NULL,3, 1, 5, 5, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (504, 'GlobalAlllocTreatMissing',1, 0, NULL, NULL,3, 1, 5, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (505, 'SupersessionMethod',1, 0, NULL, NULL,3, 1, 5, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (601, 'EnableAdjustment',1, 0, NULL, NULL,1, 1, 6, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (602, 'DownTrend',1, 0.2, NULL, NULL,1, 1, 6, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (603, 'UpTrend',1, 0.2, NULL, NULL,1, 1, 6, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (604, 'PercentOfZeros',1, 0.2, NULL, NULL,1, 1, 6, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (605, 'LogCorrection',1, 0, NULL, NULL,2, 1, 6, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (606, 'AllowNegativeForecast',1, 0, NULL, NULL,2, 1, 6, 1, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (701, 'IntermitCriterion',1, 40, NULL, NULL,2, 1, 7, 4, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (702, 'SmoothIntermittent',1, 1, NULL, NULL,1, 1, 7, 4, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (703, 'IntUpdate',1, 0.5, NULL, NULL,2, 1, 7, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (704, 'IntermitCrostonUnspread',1, 0, NULL, NULL,2, 1, 7, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (801, 'CutLeadingZeros',1, 1, NULL, NULL,3, 1, 8, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (802, 'EnableCausalsShift',1, 1, NULL, NULL,2, 1, 8, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (803, 'ShiftBaseCausals',1, 0, NULL, NULL,2, 1, 8, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (804, 'TooFew',1, 2, NULL, NULL,2, 1, 8, 0, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (901, 'TrendPreEstimation',1, 0, NULL, NULL,2, 1, 9, 6, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (902, 'TrendDampPeriod',1, 0, NULL, NULL,2, 1, 9, 6, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (903, 'TrendDampStep',1, 0, NULL, NULL,2, 1, 9, 6, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (904, 'TrendModelForShort',1, 0, NULL, NULL,2, 1, 9, 6, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (905, 'TrendOutlierRatio',1, 1, NULL, NULL,2, 1, 9, 6, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (906, 'TrendPeriod',1, 8, NULL, NULL,2, 1, 9, 6, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (907, 'TrendShortRatio',1, 1, NULL, NULL,2, 1, 9, 6, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (908, 'lead',1, 365, NULL, NULL,2, 1, 9, 6, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
INSERT into  MSC_ENG_PARAMETERS_B  values (909, 'timeunit',1, 2, NULL, NULL,2, 1, 9, 6, 'Kostya', sysdate, 'Kostya', sysdate, NULL);
