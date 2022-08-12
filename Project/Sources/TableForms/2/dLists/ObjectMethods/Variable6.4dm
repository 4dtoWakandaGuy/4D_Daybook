If (False:C215)
	//object Name: [COMPANIES]dLists.Variable6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; vText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dLists.Variable6"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		vText:=Uppers2(Substring:C12(vText; 1; 31))
		//unicode test
		
		If (Character code:C91(Substring:C12(vText; Length:C16(vText); 1))=64)
			vText:=Substring:C12(vText; 1; Length:C16(vText)-1)
		End if 
		GEN_at_Name{GEN_at_Name}:=vText
		GEN_at_Identity{GEN_at_Name}:="*"
End case 
ERR_MethodTrackerReturn("OBJ:dLists,vText"; $_t_oldMethodName)
