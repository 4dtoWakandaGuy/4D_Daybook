If (False:C215)
	//object Name: [COMPANIES]dLists.Variable4
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
	//ARRAY LONGINT(GEN_al_NameID;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_LONGINT:C283($_l_SIzeofArray; bd2; xCount)
	C_TEXT:C284($_t_oldMethodName; vText)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dLists.Variable4"; Form event code:C388)

$_l_SIzeofArray:=Size of array:C274(GEN_at_Name)+1
INSERT IN ARRAY:C227(GEN_at_Name; $_l_SIzeofArray; 1)
INSERT IN ARRAY:C227(GEN_at_RecordCode; $_l_SIzeofArray; 1)
INSERT IN ARRAY:C227(GEN_at_Identity; $_l_SIzeofArray; 1)
INSERT IN ARRAY:C227(GEN_al_NameID; $_l_SIzeofArray; 1)
GEN_at_Name:=$_l_SIzeofArray
GEN_at_RecordCode:=$_l_SIzeofArray
GEN_at_Identity:=$_l_SIzeofArray
GEN_at_Identity{$_l_SIzeofArray}:="*"
GEN_al_NameID{$_l_SIzeofArray}:=0
vText:=""
If (bd2=0)
	bd2:=1
	OBJECT SET ENTERABLE:C238(vText; True:C214)
	
	GOTO OBJECT:C206(Vtext)
	OBJECT SET ENABLED:C1123(xCount; True:C214)
	//_O_ENABLE BUTTON(xCount)
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dLists.Variable4"; $_t_oldMethodName)
