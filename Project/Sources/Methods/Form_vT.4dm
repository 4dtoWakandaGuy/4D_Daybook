//%attributes = {}
If (False:C215)
	//Project Method Name:      Form_vT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($1)
	C_LONGINT:C283($_l_CarriageReturns; $_l_StringLength)
	C_TEXT:C284($_t_oldMethodName; $2; vT)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Form_vT")
//Changed further=NG JUne 2003

If (($1) & ($2#""))
	vT:=RemoveTrailCR($2)
	$_l_CarriageReturns:=STR_CountStr(vT; Char:C90(13))
	$_l_StringLength:=Length:C16(vT)  //+($_l_CarriageReturns*40)
	If (True:C214)  // changed again NG May 31 2001
		If ($_l_StringLength>500)
			If ($_l_CarriageReturns>12)
				$_l_CarriageReturns:=12
			End if 
			vT:=Substring:C12(vT; 1; 500)+"…"
		End if 
	End if 
	If (VT#"")
		If (VT[[Length:C16(VT)]]#Char:C90(13))  //error if VT=""
			vT:=vT+Char:C90(13)
		End if 
	Else 
		VT:=Char:C90(13)
	End if 
	
Else 
	vT:=""
End if 
ERR_MethodTrackerReturn("Form_vT"; $_t_oldMethodName)