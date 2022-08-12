//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_PPSht
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:27
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(SR_bo_Validated; WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_OK; $_l_Printed; $_l_WindowReferenceRow; r0; r1; r2; s1; s2; s3; s4; vAB)
	C_LONGINT:C283(WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_CurrentWindowTitle; $_t_DocumentName; $_t_Nul; $_t_oldMethodName; $_t_Problem; $_t_Solution; vProblem; vSolution; vTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_PPSht")
//Jobs_PPSht
SR_bo_Validated:=False:C215
Menu_Record("Jobs_PPSht"; "Job Details")
If (Gen_PPChkStSing(->[ORDERS:24]State:15; 9))
	Jobs_PPBef
	
	vProblem:="@"
	vSolution:="@"
	Open_Any_Window(222; 361)
	DIALOG:C40([JOBS:26]; "dAsk_Print")
	CLOSE WINDOW:C154
	$_l_OK:=OK
	OK:=1
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	
	If ($_l_OK=1)
		If (r0=1)
			Gen_Confirm("Are you ready to print the Job & Job Stage Form?")
			If (OK=1)
				$_t_Problem:=vProblem
				$_t_Solution:=vSolution
				//Gen_PPSingle (->[JOBS];"Job_Sheet";"Jobs_Out";"";"N/A ZZZZ";"")
				$_t_DocumentName:="Job "+[JOBS:26]Job_Code:1  // 05/04/040 pb
				$_t_Nul:=""  // 05/04/04 pb
				$_t_CurrentWindowTitle:=Get window title:C450
				SET WINDOW TITLE:C213($_t_DocumentName)
				$_l_Printed:=Gen_PPSingle(->[JOBS:26]; "Job_Sheet"; "Jobs_Out"; ""; "N/A ZZZZ"; ""; 0; ->$_t_Nul; ""; ""; False:C215; $_t_DocumentName)  // 05/04/040 pb
				SET WINDOW TITLE:C213($_t_CurrentWindowTitle)
				vProblem:=$_t_Problem
				vSolution:=$_t_Solution
			End if 
		End if 
		
		If ((r1=1) & ((s1=1) | (s2=1)))
			Gen_Confirm("Are you ready to print the Cost Items List?")
			If (OK=1)
				If (Character code:C91(Substring:C12(vProblem; 1; 1))#64)
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=[JOBS:26]Job_Code:1; *)
					QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Stage:35=vProblem; *)
				Else 
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=[JOBS:26]Job_Code:1; *)
				End if 
				If ((s1=1) & (s2=0))
					QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]State:46="B")
				Else 
					If ((s2=1) & (s1=0))
						QUERY:C277([ORDER_ITEMS:25])
						QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]State:46="A"; *)
						QUERY SELECTION:C341([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]State:46=""; *)
					Else 
						QUERY:C277([ORDER_ITEMS:25])
					End if 
				End if 
				If ((DB_GetModuleSettingByNUM(Module_Assemblies))>1)
					QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Component_Level:47=vAB)
				End if 
				ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Stage:35; >; [ORDER_ITEMS:25]State:46; >; [ORDER_ITEMS:25]Sort_Order:26; >)
				BREAK LEVEL:C302(2)
				ACCUMULATE:C303([ORDER_ITEMS:25]Sales_Amount:7; [ORDER_ITEMS:25]Cost_Amount:15)
				vTitle:="JOB: "+[JOBS:26]Job_Code:1+" - COST ITEMS"
				FORM SET OUTPUT:C54([ORDER_ITEMS:25]; "Jobs_OIList")
				PRINT SELECTION:C60([ORDER_ITEMS:25])
				FORM SET OUTPUT:C54([ORDER_ITEMS:25]; "Items_OutPrint")
			End if 
		End if 
		
		If ((r2=1) & ((s3=1) | (s4=1)))
			Gen_Confirm("Are you ready to print the Job Personnel & Time Records List?")
			If (OK=1)
				If (Character code:C91(Substring:C12(vSolution; 1; 1))#64)
					QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Job_Code:1=[JOBS:26]Job_Code:1; *)
					QUERY:C277([JOB PERSONNEL:48];  & ; [JOB PERSONNEL:48]Stage_Code:2=vSolution)
				Else 
					QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Job_Code:1=[JOBS:26]Job_Code:1)
				End if 
				ORDER BY:C49([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Stage_Code:2; >; [JOB PERSONNEL:48]Person:3; >)
				BREAK LEVEL:C302(1)
				ACCUMULATE:C303([JOB PERSONNEL:48]JT_Act_Sales_Amount:6; [JOB PERSONNEL:48]JT_Budget_Sales_Amount:8; [JOB PERSONNEL:48]JT_Actual_Cost_Amount:10; [JOB PERSONNEL:48]JT_Budget_Cost_Amount:11; [JOB PERSONNEL:48]JT_Actual_Units:5; [JOB PERSONNEL:48]JT_Budget_Units:4)
				vTitle:="JOB: "+[JOBS:26]Job_Code:1+" - JOB PERSONNEL"
				FORM SET OUTPUT:C54([JOB PERSONNEL:48]; "JobPers_TRLIst")
				PRINT SELECTION:C60([JOB PERSONNEL:48])
				FORM SET OUTPUT:C54([JOB PERSONNEL:48]; "JobPers_Out")
			End if 
		End if 
		
	End if 
End if 
States_CUArr(->[JOBS:26]State:9)
QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[JOBS:26]Job_Code:1)
Jobs_InLPSort
ERR_MethodTrackerReturn("Jobs_PPSht"; $_t_oldMethodName)