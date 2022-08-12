//%attributes = {}
If (False:C215)
	//Project Method Name:      CON_ShowSubInformation
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 16:21
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(CON_aptr_LBSetup;0)
	C_LONGINT:C283($_l_ContactID; $_l_ParentProcess; $_l_ProcessState; $_l_Windowleft; $_l_WindowTop; $2; $4; $5; $6; CON_l_ContactID; CON_l_IPcall)
	C_LONGINT:C283(CON_l_ParentProcess; CON_l_SubInfoProcess; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_ContactCode; $_t_DisplayType; $_t_oldMethodName; $1; $3; CON_t_ContactCode; CON_t_DisplayType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CON_ShowSubInformation")

// This method displays a 'companion' window to the contacts screen..it closes automatically if the parent  process  finishes
If (Count parameters:C259>=6)
	
	
	Start_Process
	$_t_ContactCode:=$1
	$_l_ContactID:=$2
	$_t_DisplayType:=$3
	$_l_ParentProcess:=$4
	$_l_Windowleft:=$5
	$_l_WindowTop:=$6
	If ($_t_ContactCode#"")
		ARRAY POINTER:C280(CON_aptr_LBSetup; 0)
		CON_l_ContactID:=$_l_ContactID
		CON_t_ContactCode:=$_t_ContactCode
		CON_t_DisplayType:=$_t_DisplayType  //Note this does not change during the process
		CON_l_ParentProcess:=$_l_ParentProcess
		WIN_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153($_l_Windowleft; $_l_WindowTop; Screen width:C187-20; Screen height:C188-20; -(1984+2+4))
		DIALOG:C40([USER:15]; "CON_SubDataArea")
	Else 
		//end the process
		If ($_l_ParentProcess>0)
			$_l_ProcessState:=Process state:C330($_l_ParentProcess)
			If ($_l_ProcessState>=0)
				//Clear the reference to a running process in the process that called this
				CON_l_SubInfoProcess:=0
				SET PROCESS VARIABLE:C370($_l_ParentProcess; CON_l_SubInfoProcess; CON_l_SubInfoProcess)
				
			End if 
			
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("CON_ShowSubInformation"; $_t_oldMethodName)