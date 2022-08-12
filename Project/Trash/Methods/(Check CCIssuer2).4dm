//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Check_CCIssuer2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($i)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $nine; $src)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_CCIssuer2")
//Check_CCIssuer2
$0:=False:C215
If (Length:C16($1->)>3)
	$nine:=Substring:C12(Str_NumOnly($1->); 1; 9)
	$i:=9
	While (($0=False:C215) & ($i>3))
		$src:=Substring:C12($nine; 1; $i)
		QUERY:C277([X_URL_LInks:101]; [X_URL_LInks:101]Parent_RecordCode:2<=$src; *)
		QUERY:C277([X_URL_LInks:101];  & ; [X_URL_LInks:101]URL:3>=$src)
		If (Records in selection:C76([X_URL_LInks:101])>0)
			$0:=True:C214
		End if 
		$i:=$i-1
	End while 
End if 
ERR_MethodTrackerReturn("Check_CCIssuer2"; $_t_oldMethodName)