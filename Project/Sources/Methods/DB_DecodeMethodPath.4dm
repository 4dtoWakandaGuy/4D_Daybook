//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_DecodeMethodPath
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2013 05:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_MethodType)
	C_POINTER:C301($_ptr_table)
	C_TEXT:C284($_t_FormObjectName; $_t_Object; $_t_oldMethodName; $_t_TableName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_DecodeMethodPath")
METHOD RESOLVE PATH:C1165($1; $_l_MethodType; $_ptr_table; $_t_Object; $_t_FormObjectName; *)

Case of 
	: ($_l_MethodType=Path database method:K72:2)
		$0:=$_t_Object
	: ($_l_MethodType=Path project form:K72:3)
		If ($_t_FormObjectName#"")
			$0:=""+$_t_Object+"."+$_t_FormObjectName
		Else 
			$0:=""+$_t_Object
		End if 
	: ($_l_MethodType=Path project method:K72:1)
		$0:=$_t_Object
		
	: ($_l_MethodType=Path table form:K72:5)
		$_t_TableName:=Table name:C256($_ptr_table)
		
		If ($_t_FormObjectName#"")
			$0:="["+$_t_TableName+"]."+$_t_Object+"."+$_t_FormObjectName
		Else 
			$0:="["+$_t_TableName+"]."+$_t_Object
		End if 
	: ($_l_MethodType=Path trigger:K72:4)
		$_t_TableName:=Table name:C256($_ptr_table)
		$0:="Trigger:"+$_t_TableName
	Else 
		$0:=$1
		
		
End case 
ERR_MethodTrackerReturn("DB_DecodeMethodPath"; $_t_oldMethodName)