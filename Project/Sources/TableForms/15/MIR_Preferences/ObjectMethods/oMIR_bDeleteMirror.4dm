If (False:C215)
	//object Name: [USER]MIR_Preferences.oMIR_bDeleteMirror
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
	//ARRAY BOOLEAN(MIR_lb_Servers;0)
	//ARRAY TEXT(MIR_at_Servers;0)
	C_LONGINT:C283($i; $LSizeOfArray)
	C_TEXT:C284(<>MIR_t_ServerIPAddress; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].MIR_Preferences.oMIR_bDeleteMirror"; Form event code:C388)

If (False:C215)
	
	// Purpose: Deletes a server from the listbox
	
	
End if 


If (MIR_lb_Servers>0)
	LISTBOX DELETE ROWS:C914(MIR_lb_Servers; MIR_lb_Servers)
End if 

$LSizeOfArray:=Size of array:C274(MIR_lb_Servers)
If ($LSizeOfArray=0)  // Leave at least One enterable area
	LISTBOX INSERT ROWS:C913(MIR_lb_Servers; $LSizeOfArray+1)
End if 

<>MIR_t_ServerIPAddress:=""
For ($i; 1; Size of array:C274(MIR_at_Servers))
	If (Length:C16(MIR_at_Servers{$i})>0)
		If (Length:C16(<>MIR_t_ServerIPAddress)>0)
			<>MIR_t_ServerIPAddress:=<>MIR_t_ServerIPAddress+","
		End if 
		<>MiR_t_ServerIPAddress:=<>MIR_t_ServerIPAddress+MIR_at_Servers{$i}
	End if 
End for 
ERR_MethodTrackerReturn("OBJ [USER].MIR_Preferences.oMIR_bDeleteMirror"; $_t_oldMethodName)
