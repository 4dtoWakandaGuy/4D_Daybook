If (False:C215)
	//Table Form Method Name: [JOB_STAGES]ApplicConf_Sub
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>DataSize)
	C_REAL:C285(vAmount)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vQtyT)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [JOB_STAGES].ApplicConf_Sub"; Form event code:C388)
If (Form event code:C388=On Printing Detail:K2:18)
	SetFontsByPointerParameter(<>DataSize; ""; 0; ->[JOB_STAGES:47]Stage_Name:3; ->[JOB_STAGES:47]B_Applicant_Rate:13; ->vQtyT; ->vAmount)
	
	//Set_Fonts ("[JOB STAGES]Stage Name+[JOB STAGES]B Applic Rate"+"+vQtyT+vAmount";◊DataSize)
	RELATE ONE:C42([JOB_STAGES:47]Stage_Code:2)
	If (([STAGES:45]Show_Qty:7) | (DB_t_CurrentFormUsage="Payment"))
		If ([STAGES:45]Show_Hours:8)
			vQtyT:=String:C10([JOB_STAGES:47]B_Actual_Hours:15; 2)
		Else 
			vQtyT:=String:C10([JOB_STAGES:47]AT_Actual_Units:5)
		End if 
		vAmount:=[JOB_STAGES:47]AT_Budget_Sales_Amount:8
	Else 
		vQtyT:=""
		vAmount:=0
	End if 
End if 
ERR_MethodTrackerReturn("FM [JOB_STAGES].ApplicConf_Sub"; $_t_oldMethodName)
