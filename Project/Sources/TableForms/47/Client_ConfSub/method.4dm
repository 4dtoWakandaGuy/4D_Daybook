If (False:C215)
	//Table Form Method Name: [JOB_STAGES]Client_ConfSub
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
	C_TEXT:C284($_t_oldMethodName; vQtyT)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [JOB_STAGES].Client_ConfSub"; Form event code:C388)
If (Form event code:C388=On Printing Detail:K2:18)
	SetFontsByPointerParameter(<>DataSize; ""; 0; ->[JOB_STAGES:47]Stage_Name:3; ->[JOB_STAGES:47]B_Client_Rate:12; ->vQtyT; ->vAmount)
	
	//Set_Fonts ("[JOB STAGES]Stage Name+[JOB STAGES]B Client Rate"+"+vQtyT+vAmount";◊DataSize)
	RELATE ONE:C42([JOB_STAGES:47]Stage_Code:2)
	If ([STAGES:45]Show_Qty:7)
		If ([STAGES:45]Show_Hours:8)
			vQtyT:=String:C10([JOB_STAGES:47]B_Actual_Hours:15; 2)
		Else 
			vQtyT:=String:C10([JOB_STAGES:47]AT_Actual_Units:5)
		End if 
		vAmount:=[JOB_STAGES:47]AS_Quoted_Amount:7
	Else 
		vQtyT:=""
		vAmount:=0
	End if 
End if 
ERR_MethodTrackerReturn("FM [JOB_STAGES].Client_ConfSub"; $_t_oldMethodName)
