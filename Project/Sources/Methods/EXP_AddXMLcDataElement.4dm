//%attributes = {}
If (False:C215)
	//Project Method Name:      EXP_AddXMLcDataElement
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_CloseElement; $4)
	C_LONGINT:C283($_l_Type)
	C_POINTER:C301($3)
	C_TEXT:C284($_t_oldMethodName; $2)
	C_TIME:C306($1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EXP_AddXMLcDataElement")
If (Count parameters:C259>=3)
	If (Count parameters:C259>=4)
		$_bo_CloseElement:=$4
	Else 
		$_bo_CloseElement:=True:C214
	End if 
	If ($1#?00:00:00?)
		
		If ($2#"")
			$_l_Type:=Type:C295($3->)
			If ($_l_Type=30)
				SAX OPEN XML ELEMENT:C853($1; $2)
				BASE64 ENCODE:C895($3->)
				SAX ADD XML CDATA:C856($1; $3->)
			Else 
				SAX ADD XML CDATA:C856($1; $3->)
			End if 
			
		End if 
		If ($_bo_CloseElement)
			SAX CLOSE XML ELEMENT:C854($1)
			
		End if 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("EXP_AddXMLcDataElement"; $_t_oldMethodName)