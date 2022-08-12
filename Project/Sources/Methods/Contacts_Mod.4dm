//%attributes = {}
If (False:C215)
	//Project Method Name:      Contacts_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/05/2010 17:02
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>DB_bo_AutoOut; $_bo_AutoOut; $_bo_AutoSearch)
	C_LONGINT:C283(<>ButtProc; $_l_BarProcess; $_l_ProcessState; $_l_TableNumber; $_l_Value; CON_l_IPcall; CON_l_SubInfoProcess; vO)
	C_TEXT:C284($_t_AutosearchCode; $_t_oldMethodName; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts_Mod")

$_bo_AutoSearch:=False:C215

If (Count parameters:C259>=2)
	$_bo_AutoSearch:=($2="TRUE")
	
	$_t_AutosearchCode:=$1
	$_bo_AutoOut:=<>DB_bo_AutoOut
	<>DB_bo_AutoOut:=False:C215
Else 
	$_bo_AutoSearch:=False:C215
	$_t_AutosearchCode:=""
	$_bo_AutoOut:=<>DB_bo_AutoOut
	
	vO:=1
End if 
Start_Process
Contacts_File
While (vO=1)
	If ($_bo_AutoSearch)
		Cont_Sel($_t_AutosearchCode; $_bo_AutoSearch)
		COPY NAMED SELECTION:C331([CONTACTS:1]; "ConPreselection")
	Else 
		ALL RECORDS:C47([CONTACTS:1])
		COPY NAMED SELECTION:C331([CONTACTS:1]; "ConPreselection")
	End if 
	If (False:C215)
		Gen_ModMid("View Contacts"; "OMaster"; ->[CONTACTS:1]; ->vO; "Contacts"; "")
		//NG the code below using parameters does not seem to be used anywhere
		If (Count parameters:C259>=1) & ((vO=-1) | (vO=0)) & (False:C215)
			If (vO#-1)  //& (vO#0)
				If (Records in set:C195("userset")>0)
					USE SET:C118("Userset")
				Else 
					USE SET:C118("OMaster")
				End if 
				
				$_l_Value:=-1
				CREATE SET:C116([CONTACTS:1]; "<>SelectedRecords")
				
				//CALL PROCESS($1)
				//we want to call back the method that called this
			Else 
				
				$_l_Value:=-1
				CREATE EMPTY SET:C140([CONTACTS:1]; "<>SelectedRecords")
				
			End if 
		End if 
	Else 
		vO:=0
		$_l_TableNumber:=Table:C252(->[CONTACTS:1])
		
		DBI_DisplayRecords($_l_TableNumber; "ConPreselection"; ""; 1)
		$_l_BarProcess:=Get_ProcessNumber("Modules_Palette")
		If ($_l_BarProcess>0)
			SHOW PROCESS:C325($_l_BarProcess)
			
		End if 
		If (<>ButtProc>0)
			SHOW PROCESS:C325(<>ButtProc)
		End if 
		
	End if 
End while 
If (CON_l_SubInfoProcess>0)
	$_l_ProcessState:=Process state:C330(CON_l_SubInfoProcess)
	If ($_l_ProcessState>=0)
		SET PROCESS VARIABLE:C370(CON_l_SubInfoProcess; CON_l_IPcall; 301)
		POST OUTSIDE CALL:C329(CON_l_SubInfoProcess)
	End if 
	
End if 
<>DB_bo_AutoOut:=$_bo_AutoOut
Cont_Unload
Comp_Unload
Process_End
ERR_MethodTrackerReturn("Contacts_Mod"; $_t_oldMethodName)
