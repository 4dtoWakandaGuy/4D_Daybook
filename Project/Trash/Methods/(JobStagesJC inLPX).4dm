//%attributes = {"invisible":true}

If (False:C215)
	//Project Method Name:      JobStagesJC inLPX
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_isUnique)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $_t_StageCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStagesJC inLPX")

//added 15/02/07 - kmw
//duplicate of JobStages_inLPX but changed (back to the way it originally was?) to be specifc to JOB COSTING jobs

$_t_oldMethodName:=ERR_MethodTracker("JobStagesJC inLPX")
//Contacts_InLPX
//Note that the fields with nothing in the case statement
//either had nothing in the JobStages_LP or just set the modified flag and ran the macro
//VT4 was used to indicate the stage had modified which caused elements in the during phase of the parent form to execute.

If (Count parameters:C259>=1)
	Case of 
		: ($1=(->[JOB_STAGES:47]AS_Invoice_Excluding_Tax:9))
			
		: ($1=(->[JOB_STAGES:47]AS_Invoice_Including_Tax:28))
		: ($1=(->[JOB_STAGES:47]AS_Quoted_Amount:7))
			If ([JOB_STAGES:47]JS_Quoted_Qty:46>0)  //added NaN check 16/02/07 -kmw
				[JOB_STAGES:47]JS_Quoted_Price:47:=[JOB_STAGES:47]AS_Quoted_Amount:7/[JOB_STAGES:47]JS_Quoted_Qty:46
			End if 
			//
		: ($1=(->[JOB_STAGES:47]AT_Actual_Units:5))
			
		: ($1=(->[JOB_STAGES:47]AT_Budget_Sales_Amount:8))
			
		: ($1=(->[JOB_STAGES:47]X_Actual_Hours_Entry:51)) | ($1=(->[JOB_STAGES:47]X_actual_Minutes:53))  // ($1=(->[JOB STAGES]B Actual Hours))
			
			
		: ($1=(->[JOB_STAGES:47]Description:48))
			
		: ($1=(->[JOB_STAGES:47]Invoice_Number:10))
			//Code from JobStages_LP
			[JOB_STAGES:47]Invoice_Number:10:=Uppercase:C13([JOB_STAGES:47]Invoice_Number:10)
			RELATE ONE:C42([JOB_STAGES:47]Invoice_Number:10)
			If (Records in selection:C76([INVOICES:39])>0)
				Gen_Alert("You cannot add items to existing Invoices"; "Cancel")
				[JOB_STAGES:47]Invoice_Number:10:=Old:C35([JOB_STAGES:47]Invoice_Number:10)
			End if 
			
		: ($1=(->[JOB_STAGES:47]JC_Actual_Cost_Amount:32))
			
		: ($1=(->[JOB_STAGES:47]JC_Actual_Sales_Amount:31))
			
		: ($1=(->[JOB_STAGES:47]JC_Budget_Cost_Amount:34))
			
		: ($1=(->[JOB_STAGES:47]JC_Budget_Sales_Amount:33))
			
		: ($1=(->[JOB_STAGES:47]JC_WIP_Cost_Amount:44))
		: ($1=(->[JOB_STAGES:47]Job_Code:1))
		: ($1=(->[JOB_STAGES:47]JS_Actual_Cost_Amount:36))
		: ($1=(->[JOB_STAGES:47]JS_Actual_Margin:39))
		: ($1=(->[JOB_STAGES:47]JS_Actual_Margin_PC:40))
		: ($1=(->[JOB_STAGES:47]JS_Actual_Sales_Amount:35))
		: ($1=(->[JOB_STAGES:47]JS_Budget_Cost_Amount:38))
		: ($1=(->[JOB_STAGES:47]JS_Budget_Margin:41))
		: ($1=(->[JOB_STAGES:47]JS_Budget_Margin_PC:42))
		: ($1=(->[JOB_STAGES:47]JS_Budget_Sales_Amount:37))
		: ($1=(->[JOB_STAGES:47]JS_Quoted_Price:47))
			[JOB_STAGES:47]AS_Quoted_Amount:7:=[JOB_STAGES:47]JS_Quoted_Price:47*[JOB_STAGES:47]JS_Quoted_Qty:46
			
		: ($1=(->[JOB_STAGES:47]JS_Quoted_Qty:46))
			[JOB_STAGES:47]AS_Quoted_Amount:7:=[JOB_STAGES:47]JS_Quoted_Price:47*[JOB_STAGES:47]JS_Quoted_Qty:46  //Gen_Round (([JOB STAGES]JS Quoted Price*[JOB STAGES]JS Quoted Qty);2;2)
			
		: ($1=(->[JOB_STAGES:47]JS_WIP_Cost_Amount:45))
		: ($1=(->[JOB_STAGES:47]JS_Locked:16))
		: ($1=(->[JOB_STAGES:47]JT_Actual_Cost_Amount:29))
		: ($1=(->[JOB_STAGES:47]JT_Actual_Sales_Amount:6))
			Check_Sec(->[JOB_STAGES:47]JT_Actual_Sales_Amount:6; ->[JOB_STAGES:47]JS_Locked:16)
			
		: ($1=(->[JOB_STAGES:47]JT_Budget_Cost_Amount:30))
		: ($1=(->[JOB_STAGES:47]JT_Budget_Units:4))
			//Check_Sec (->[JOB STAGES]Invoice No;->[JOB STAGES]JS_Locked)
			Check_Sec(->[JOB_STAGES:47]JT_Budget_Units:4; ->[JOB_STAGES:47]JS_Locked:16)  //Fixed bug carried through from original version of this method -kmw, 15/03/07
			
		: ($1=(->[JOB_STAGES:47]JT_WIP_Cost_Amount:43))
		: ($1=(->[JOB_STAGES:47]Print_Description:49))
			
		: ($1=(->[JOB_STAGES:47]Required_Date:50))
		: ($1=(->[JOB_STAGES:47]Stage_Code:2))
			
			//Check_MinorNC (->[JOB STAGES]Stage Code;"Stage";->[STAGES];->[STAGES]Stage Code;->[STAGES]Stage Name)
			
			Check_MinorNC(->[JOB_STAGES:47]Stage_Code:2; "Stage"; ->[STAGES:45]; ->[STAGES:45]Stage_Code:1; ->[STAGES:45]Stage_Name:2)
			
			
			If ([JOB_STAGES:47]Stage_Code:2#"")
				//`the following is an assimilation what was in JobStages_LP
				$_l_isUnique:=0
				SET QUERY DESTINATION:C396(3; $_l_isUnique)
				$_t_StageCode:=[JOB_STAGES:47]Stage_Code:2
				//`end assimilation
				QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[JOBS:26]Job_Code:1; *)
				QUERY:C277([JOB_STAGES:47];  & ; [JOB_STAGES:47]Stage_Code:2=$_t_StageCode)
				SET QUERY DESTINATION:C396(0)
				If ($_l_isUnique>0)
					Gen_Alert("That Stage Code has already been used on this Job"; "Try again")
					[JOB_STAGES:47]Stage_Code:2:=""
				End if 
				If ([JOB_STAGES:47]Stage_Code:2#"")
					//`end assimilation
					If ([JOB_STAGES:47]Stage_Name:3="")
						[JOB_STAGES:47]Stage_Name:3:=[STAGES:45]Stage_Name:2
					End if 
					
				End if 
			End if 
			
		: ($1=(->[JOB_STAGES:47]Stage_Name:3))
			
		: ($1=(->[JOB_STAGES:47]TAX_Code:14))
			Check_MinorNC(->[JOB_STAGES:47]TAX_Code:14; ""; ->[TAX_CODES:35]; ->[TAX_CODES:35]Tax_Code:1; ->[TAX_CODES:35]Tax_Rate:3; Term VATWT("VAT Code"))
			If ([JOB_STAGES:47]TAX_Code:14="")  //code from JobStages_LP
				RELATE ONE:C42([JOBS:26]Company_Code:3)  // also cant work here!!
				[JOB_STAGES:47]TAX_Code:14:=Gen_LPTax
			End if 
			
	End case 
	
	
	Macro_AccTypePt($1)
	
End if 
ERR_MethodTrackerReturn("JobStagesJC inLPX"; $_t_oldMethodName)