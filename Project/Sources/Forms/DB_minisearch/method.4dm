
If (False:C215)
	//Database Method Name:      DB_minisearch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  21/09/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(ACC_ad_PeriodDate;0)
	//ARRAY DATE(ACC_ad_PeriodToDate;0)
	//ARRAY INTEGER(ACC_ad_PeriodFromDate;0)
	//ARRAY TEXT(ACC_at_PeriodCode;0)
	//ARRAY TEXT(ACC_at_PeriodName;0)
	C_LONGINT:C283($_l_FormEvent; SRCH_l_FieldType)
	C_TEXT:C284($_t_oldMethodName; SRCH_t_FieldName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [projectForm]/DB_minisearch/{formMethod}"; Form event code:C388)


$_l_FormEvent:=Form event code:C388
Case of 
	: ($_l_FormEvent=On Load:K2:1)
		//TRACE
		
		Case of 
			: (SRCH_t_FieldName="Period Code")  //Fill Drop down with values goto Page_6
				ALL RECORDS:C47([PERIODS:33])
				ARRAY TEXT:C222(ACC_at_PeriodName; 0)
				ARRAY TEXT:C222(ACC_at_PeriodCode; 0)
				ARRAY DATE:C224(ACC_ad_PeriodFromDate; 0)
				ARRAY DATE:C224(ACC_ad_PeriodToDate; 0)
				SELECTION TO ARRAY:C260([PERIODS:33]Period_Name:2; ACC_at_PeriodName; [PERIODS:33]Period_Code:1; ACC_at_PeriodCode; [PERIODS:33]From_Date:3; ACC_ad_PeriodFromDate; [PERIODS:33]To_Date:4; ACC_ad_PeriodToDate)
				SORT ARRAY:C229(ACC_ad_PeriodFromDate; ACC_ad_PeriodToDate; ACC_at_PeriodName; ACC_at_PeriodCode; <)
				ACC_at_PeriodCode:=0
				FORM GOTO PAGE:C247(6)
				
			: (SRCH_l_FieldType=Is longint:K8:6) | (SRCH_l_FieldType=Is real:K8:4) | (SRCH_l_FieldType=Is integer:K8:5)
				FORM GOTO PAGE:C247(3)
			: (SRCH_l_FieldType=Is date:K8:7)
				FORM GOTO PAGE:C247(2)
			: (SRCH_l_FieldType=Is time:K8:8)
				FORM GOTO PAGE:C247(4)
			: (SRCH_l_FieldType=Is boolean:K8:9)
				FORM GOTO PAGE:C247(5)
		End case 
End case 
ERR_MethodTrackerReturn("FM [projectForm]/DB_minisearch/{formMethod}"; $_t_oldMethodName)
