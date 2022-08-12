//%attributes = {}
If (False:C215)
	//Project Method Name:      Tel_Process
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/09/2009 08:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>TEL_al_4DProcess;0)
	//ARRAY LONGINT(<>TEL_al_ResourceID;0)
	//ARRAY LONGINT(<>TEL_al_TVProcess;0)
	//ARRAY TEXT(<>TEL_at_Processname;0)
	//ARRAY TEXT(<>TEL_at_ResourceTypes;0)
	C_BOOLEAN:C305(<>TelInstall; <>TelServer)
	C_LONGINT:C283($i)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel_Process")

If ((DB_GetModuleSettingByNUM(32))>1)
	If (<>TelServer)
		INSERT IN ARRAY:C227(<>TEL_at_ResourceTypes; 999)
		INSERT IN ARRAY:C227(<>TEL_al_ResourceID; 999)
		INSERT IN ARRAY:C227(<>TEL_at_Processname; 999)
		INSERT IN ARRAY:C227(<>TEL_al_4DProcess; 999)
		INSERT IN ARRAY:C227(<>TEL_al_TVProcess; 999)
		$i:=Size of array:C274(<>TEL_at_ResourceTypes)
		
		<>TEL_at_ResourceTypes{$i}:="NVOX"  //could also be NVFX, NINT NEXT etc
		<>TEL_al_ResourceID{$i}:=$i
		<>TEL_at_Processname{$i}:=$1  //or your routine
		<>TelInstall:=False:C215
		$_t_ProcessName:="Telephony "+String:C10($i)
		<>TEL_al_4DProcess{$i}:=New process:C317("Tel_Main"; 256000; $_t_ProcessName)
		If (<>TEL_al_4DProcess{$i}=0)
			Gen_Alert("Error in launching process")
			$i:=5
		Else 
			Process_StartAr(<>TEL_al_4DProcess{$i}; $_t_ProcessName)  //to put it on the processes pal
			$i:=0
			Repeat 
				IDLE:C311
				$i:=$i+1
			Until ((<>TelInstall) | ($i>5000))
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Tel_Process"; $_t_oldMethodName)
