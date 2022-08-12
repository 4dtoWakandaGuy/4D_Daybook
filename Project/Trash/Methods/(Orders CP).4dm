//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders CP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/03/2010 11:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(ORD_bo_IsRevision)
	C_LONGINT:C283($_l_Process; SD_l_ParentProcess)
	C_REAL:C285(ORD_r_SubSelection)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_CurrentOutputform; $_t_DragString; $_t_oldMethodName; $_t_OrderCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders CP")
If (Not:C34(ORD_bo_IsRevision))
	$_t_CurrentOutputform:=WIN_t_CurrentOutputform
	$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
	Menu_Record("Orders CP"; "Copy Previous")
	If (In_ButtChkMan(->[ORDERS:24]; "3"))
		If (Gen_PPChkStSing(->[ORDERS:24]State:15; 18))
			//much simpler
			$_t_DragString:="OrdItems"
			//AL_SetDrgDst (eALOrdII;1;$_t_DragString)
			LBI_SetDRGPair(1; ->ORD_r_SubSelection; $_t_DragString)
			//$_l_Process:=New process("Orders_Mod";DB_ProcessMemoryinit(4);"Copy Previous to"+String(Current process);String(Current process);"";"";"";"";"-1";*)
			$_l_Process:=New process:C317("DBI_DisplayRecords"; 512000; "Copy Previous to"+String:C10(Current process:C322); Table:C252(->[ORDERS:24]); ""; "Copy Order"; 1; False:C215; True:C214; True:C214; Current process:C322; False:C215; False:C215; True:C214; True:C214; 0; False:C215; False:C215; False:C215)
			
			SHOW PROCESS:C325($_l_Process)
			BRING TO FRONT:C326($_l_Process)
			SET PROCESS VARIABLE:C370($_l_Process; ORD_bo_IsRevision; True:C214)
			SET PROCESS VARIABLE:C370($_l_Process; SD_l_ParentProcess; Current process:C322)
			
			
			
		End if 
	End if 
	READ WRITE:C146([ORDERS:24])
	WIN_t_CurrentOutputform:=$_t_CurrentOutputform
	
	DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
Else 
	Gen_Alert("This Function cannot be used when viewing previous revisions")
End if 
ERR_MethodTrackerReturn("Orders CP"; $_t_oldMethodName)
