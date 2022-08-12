//%attributes = {}
//---------- Type Parameters & Local Variables ----------
ARRAY TEXT:C222($_at_ProjectFormMethods; 0)
C_BOOLEAN:C305($_Bo_ParseForm)
C_LONGINT:C283($_l_isthisaform; $_l_MethodType; $_l_Position; $_l_TestObject)
C_POINTER:C301($_Ptr_ParseForm; $2; $3)
C_TEXT:C284($_Txt_FormMethodPath; $_Txt_FormName; $_Txt_FullMethodName; $_Txt_ObjectName; $0; $1)
//---------- Reassign Passed Parameters OR get values ----------


If (False:C215)
	//this method builds the object name for the comments in the header, this includes an object type
End if 
C_TEXT:C284($1; $_Txt_ObjectName; $0)
C_LONGINT:C283($_l_MethodType)
C_BOOLEAN:C305($_Bo_ParseForm)
C_POINTER:C301($2; $3)
If (Count parameters:C259>=3)
	$_Bo_ParseForm:=False:C215
	$_Txt_FullMethodName:=$1
	$_l_MethodType:=$2->
	$_Ptr_ParseForm:=$3
	
	Case of 
		: ($_l_MethodType=Path database method:K72:2)
			$_Txt_ObjectName:="Project Method "+$_Txt_FullMethodName
			
		: ($_l_MethodType=Path project form:K72:3)
			$_Bo_ParseForm:=True:C214
			$_Txt_ObjectName:="FM "+$_Txt_ObjectName
		: ($_l_MethodType=(Path project form:K72:3+99))
			$_Bo_ParseForm:=True:C214
			$_Txt_ObjectName:="OBJ "+$_Txt_ObjectName
		: ($_l_MethodType=Path project method:K72:1)
			
		: ($_l_MethodType=Path table form:K72:5)
			$_Bo_ParseForm:=True:C214
			$_Txt_ObjectName:="FM "+$_Txt_ObjectName
		: ($_l_MethodType=(Path table form:K72:5+99))
			$_Bo_ParseForm:=True:C214
			$_Txt_ObjectName:="OBJ "+$_Txt_ObjectName
		: ($_l_MethodType=Path trigger:K72:4)
			$_Txt_ObjectName:="Trigger "+$_Txt_ObjectName
		Else 
			$_Txt_ObjectName:=$_Txt_FullMethodName
			$_l_TestObject:=Position:C15("["; $_Txt_ObjectName)
			If ($_l_TestObject=0)
				If (Position:C15("."; $_Txt_ObjectName)>0)
					$_l_MethodType:=Path project form:K72:3+99
					$_Txt_ObjectName:="OBJ "+$_Txt_ObjectName
					$_Bo_ParseForm:=True:C214
				Else 
					ARRAY TEXT:C222($_at_ProjectFormMethods; 0)
					METHOD GET PATHS:C1163(4; $_at_ProjectFormMethods)
					$_Txt_FormMethodPath:="[projectform]/"+$_Txt_FullMethodName+"/{formMethod}"
					$_l_isthisaform:=Find in array:C230($_at_ProjectFormMethods; $_Txt_FormMethodPath)
					If ($_l_isthisaform<0)
						//then its either a database method or a project method
						$_l_MethodType:=Path project method:K72:1
					Else 
						$_l_MethodType:=Path table form:K72:5
						$_Txt_ObjectName:="FM "+$_Txt_ObjectName
					End if 
					
				End if 
			Else 
				If (Position:C15("Trigger on"; $_Txt_FullMethodName)>0)
					//its a trigger
					$_Txt_ObjectName:=Replace string:C233($_Txt_ObjectName; "Trigger On"; "")
					$_Txt_ObjectName:="Trigger "+$_Txt_ObjectName
					$_l_MethodType:=Path trigger:K72:4
					
				Else 
					$_l_Position:=Position:C15("]"; $_Txt_ObjectName)
					$_Txt_FormName:=Substring:C12($_Txt_ObjectName; $_l_Position+2)
					$_l_Position:=Position:C15("."; $_Txt_ObjectName)
					If ($_l_Position>0)
						$_l_MethodType:=Path table form:K72:5+99
						$_Txt_ObjectName:="OBJ "+$_Txt_FormName
						$_Bo_ParseForm:=True:C214
					Else 
						$_l_MethodType:=Path table form:K72:5
						$_Txt_ObjectName:="FM "+$_Txt_FormName
						$_Bo_ParseForm:=True:C214
					End if 
				End if 
				
			End if 
			
	End case 
	$0:=$_Txt_ObjectName
	$2->:=$_l_MethodType
	$3->:=$_Bo_ParseForm
End if 