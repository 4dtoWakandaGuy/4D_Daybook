//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_SSC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_POINTER:C301($2; $3)
	C_TEXT:C284($_t_District; $_t_oldMethodName; $_t_PostTown; $_t_Sector; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_SSC")
$0:=True:C214
If (DB_GetModuleSettingByNUM(31)>0)
	If ($1#"")
		$_t_District:=FirstWord($1)
		QUERY:C277([MAILSORT_A:77]; [MAILSORT_A:77]District:2=$_t_District; *)
		QUERY:C277([MAILSORT_A:77];  & ; [MAILSORT_A:77]Record_Type:1="0")
		If (Records in selection:C76([MAILSORT_A:77])>0)
			$3->:=[MAILSORT_A:77]SSC:4
			// If ($2»="")
			//  $s:=Substring([MAILSORT A]SSC;1;3)
			//  SEARCH([MAILSORT C];[MAILSORT C]Residue Code=$s)
			//  If (◊CapTown)
			//    $2»:=[MAILSORT C]Post Town
			//  Else
			//   $2»:=Uppers2 (Lowercase([MAILSORT C]Post Town))
			//  End if
			// End if
		Else 
			$1:=Substring:C12($1; Length:C16($_t_District)+2; 20)
			If ($1#"")
				$_t_Sector:=Substring:C12(FirstWord($1); 1; 1)
				QUERY:C277([MAILSORT_A:77]; [MAILSORT_A:77]District:2=$_t_District; *)
				QUERY:C277([MAILSORT_A:77];  & ; [MAILSORT_A:77]Sector:3=$_t_PostTown; *)
				QUERY:C277([MAILSORT_A:77];  & ; [MAILSORT_A:77]Record_Type:1="1")
			End if 
			If (Records in selection:C76([MAILSORT_A:77])>0)
				$3->:=[MAILSORT_A:77]SSC:4
				//  If ($2»="")
				// $s:=Substring([MAILSORT A]SSC;1;3)
				// SEARCH([MAILSORT C]Residue Code=$s)
				//  If (◊CapTown)
				//   $2»:=[MAILSORT C]Post Town
				//  Else
				//  $2»:=Uppers2 (Lowercase([MAILSORT C]Post Town))
				// End if
				//  End if
			Else 
				If ($1#"")
					$0:=False:C215
				End if 
				If ($2->#"")
					$_t_PostTown:=Substring:C12($2->; 1; 10)
					QUERY:C277([MAILSORT_C:79]; [MAILSORT_C:79]Post_Town:1=$_t_PostTown)
					If (Records in selection:C76([MAILSORT_C:79])>0)
						$3->:=[MAILSORT_C:79]Residue_Code:2+"00"
					Else 
						$3->:="00000"
					End if 
				Else 
					$3->:="00000"
				End if 
			End if 
		End if 
	Else 
		If ($2->#"")
			$_t_PostTown:=Substring:C12($2->; 1; 10)
			QUERY:C277([MAILSORT_C:79]; [MAILSORT_C:79]Post_Town:1=$_t_PostTown)
			If (Records in selection:C76([MAILSORT_C:79])>0)
				$3->:=[MAILSORT_C:79]Residue_Code:2+"00"
			Else 
				$3->:="00000"
			End if 
		Else 
			$3->:="00000"
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Check_SSC"; $_t_oldMethodName)