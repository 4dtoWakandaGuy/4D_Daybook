If (False:C215)
	//object Name: [WEBSETUP_4D]WebLog.Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 09:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>GEN_al_CacheCount;0)
	//ARRAY TEXT(<>GEN_at_CacheName;0)
	C_LONGINT:C283($_l_Index; $_l_TableCount)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].WebLog.Button1"; Form event code:C388)

READ ONLY:C145(*)

$_l_TableCount:=Get last table number:C254+2
ARRAY TEXT:C222(<>GEN_at_CacheName; $_l_TableCount)
ARRAY LONGINT:C221(<>GEN_al_CacheCount; $_l_TableCount)

For ($_l_Index; 1; Get last table number:C254)
	If (Is table number valid:C999($_l_Index))
		$_ptr_Table:=Table:C252($_l_Index)
		<>GEN_at_CacheName{$_l_Index}:=Table name:C256($_l_Index)
		<>GEN_al_CacheCount{$_l_Index}:=Records in table:C83($_ptr_Table->)
	End if 
	
End for 

//◊GEN_as_CacheName{$_l_Index}:="Macro Cache"
//◊GEN_ai_CacheCount{$_l_Index}:=  `Size of array(◊MAC_as_MacroIndex)
//$_l_Index:=$_l_Index+1

//◊GEN_as_CacheName{$_l_Index}:="Cache Arrays"
//◊GEN_ai_CacheCount{$_l_Index}:=Size of array(◊CAC_as_CacheIndex)
//$_l_Index:=$_l_Index+1
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].WebLog.Button1"; $_t_oldMethodName)