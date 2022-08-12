If (False:C215)
	//object Name: [COMPANIES]dProcesses2.Variable7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PRC_al_ProcessNum;0)
	//ARRAY TEXT(PRC_at_ProcessName;0)
	C_LONGINT:C283($nt)
	C_TEXT:C284($_t_oldMethodName; $t)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dProcesses2.Variable7"; Form event code:C388)
If (Size of array:C274(PRC_al_ProcessNum)>0)
	$t:=Substring:C12(Gen_Request("Delay Time_In minutes:"; "2"); 1; 11)
	If (OK=1)
		$nt:=Num:C11($t)*60*60
		If ((PRC_at_ProcessName>0) & (Size of array:C274(PRC_al_ProcessNum)>=PRC_at_ProcessName))
			If (Process state:C330(PRC_al_ProcessNum{PRC_at_ProcessName})=5)
				RESUME PROCESS:C320(PRC_al_ProcessNum{PRC_at_ProcessName})
			End if 
			DelayTicks($nt)
		Else 
			Process_GenAll("Sleep"; $nt)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dProcesses2.Variable7"; $_t_oldMethodName)
