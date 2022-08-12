//%attributes = {}
//---------- Type Parameters & Local Variables ----------
C_LONGINT:C283($_l_MethodType)
C_POINTER:C301($_Ptr_Table; $2)
C_TEXT:C284($_bo_FormorMethod; $_txt_formObjectName; $_Txt_tableName; $0; $1)
//---------- Reassign Passed Parameters OR get values ----------

C_LONGINT:C283($_l_MethodType)
C_POINTER:C301($_Ptr_Table)
C_TEXT:C284($_Txt_tableName)
C_TEXT:C284($_txt_formObjectName; $_bo_FormorMethod)
C_TEXT:C284($0)
C_TEXT:C284($1)
C_POINTER:C301($2)

If (False:C215)
	//This core method-part of the code manager will return the type of the object
	
End if 
C_POINTER:C301($_Ptr_Table)
C_LONGINT:C283($_l_MethodType)
C_POINTER:C301($2)

METHOD RESOLVE PATH:C1165($1; $_l_MethodType; $_Ptr_Table; $_bo_FormorMethod; $_txt_formObjectName; *)
If (Count parameters:C259>=2)
	$2->:=$_l_MethodType
End if 

Case of 
	: ($_l_MethodType=Path database method:K72:2)
		
		$0:=$_bo_FormorMethod
	: ($_l_MethodType=Path project form:K72:3)
		If ($_txt_formObjectName#"")
			If (Count parameters:C259>=2)
				$2->:=$2->+99
			End if 
			$0:=""+$_bo_FormorMethod+"."+$_txt_formObjectName
		Else 
			
			$0:=""+$_bo_FormorMethod
		End if 
	: ($_l_MethodType=Path project method:K72:1)
		$0:=$_bo_FormorMethod
		
	: ($_l_MethodType=Path table form:K72:5)
		$_Txt_tableName:=Table name:C256($_Ptr_Table)
		
		If ($_txt_formObjectName#"")
			If (Count parameters:C259>2)
				$2->:=$2->+99
			End if 
			
			$0:="["+$_Txt_tableName+"]."+$_bo_FormorMethod+"."+$_txt_formObjectName
		Else 
			$0:="["+$_Txt_tableName+"]."+$_bo_FormorMethod
		End if 
	: ($_l_MethodType=Path trigger:K72:4)
		$_Txt_tableName:=Table name:C256($_Ptr_Table)
		$0:="["+$_Txt_tableName+"]"
	Else 
		//TRACE
		
End case 