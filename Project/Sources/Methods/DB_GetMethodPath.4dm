//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetMethodPath
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_MethodType)
	C_POINTER:C301($_ptr_Table; $2)
	C_TEXT:C284($_t_FormObjectName; $_t_ObjectName; $_t_oldMethodName; $_t_TableName; $0; $1)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_GetMethodPath")

METHOD RESOLVE PATH:C1165($1; $_l_MethodType; $_ptr_Table; $_t_ObjectName; $_t_FormObjectName; *)
If (Count parameters:C259>=2)
	$2->:=$_l_MethodType
End if 

Case of 
	: ($_l_MethodType=Path database method:K72:2)
		
		$0:=$_t_ObjectName
	: ($_l_MethodType=Path project form:K72:3)
		If ($_t_FormObjectName#"")
			$2->:=$2->+99
			$0:=""+$_t_ObjectName+"."+$_t_FormObjectName
		Else 
			
			$0:=""+$_t_ObjectName
		End if 
	: ($_l_MethodType=Path project method:K72:1)
		$0:=$_t_ObjectName
		
	: ($_l_MethodType=Path table form:K72:5)
		$_t_TableName:=Table name:C256($_ptr_Table)
		
		If ($_t_FormObjectName#"")
			$2->:=$2->+99
			$0:="["+$_t_TableName+"]."+$_t_ObjectName+"."+$_t_FormObjectName
		Else 
			$0:="["+$_t_TableName+"]."+$_t_ObjectName
		End if 
	: ($_l_MethodType=Path trigger:K72:4)
		$_t_TableName:=Table name:C256($_ptr_Table)
		$0:="["+$_t_TableName+"]"
	Else 
		//TRACE
		
End case 
ERR_MethodTrackerReturn("DB_TranslateMethodPath"; $_t_oldMethodName)