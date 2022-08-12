//%attributes = {}
If (False:C215)
	//Project Method Name:      Layouts_OutDel
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
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	C_LONGINT:C283($_l_PreviewRow; vNo)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_CurrentFormUsage; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Layouts_OutDel")
//Layouts_OutDel

If (Records in set:C195("Userset")>0)
	Are_You_Sure
	If (OK=1)
		CREATE SET:C116([LIST_LAYOUTS:96]; "Master")
		USE SET:C118("Userset")
		$_t_CurrentFormUsage:=Substring:C12([LIST_LAYOUTS:96]Layout_Reference:1; 6; 15)
		DELETE SELECTION:C66([LIST_LAYOUTS:96])
		USE SET:C118("Master")
		vNo:=Records in selection:C76([LIST_LAYOUTS:96])
		If (vNo=0)
			$_l_PreviewRow:=Find in array:C230(SVS_at_PreviewEvent; $_t_CurrentFormUsage)
			If ($_l_PreviewRow>0)
				DELETE FROM ARRAY:C228(SVS_at_PreviewEvent; $_l_PreviewRow; 1)
				$_l_PreviewRow:=Find in array:C230(SVS_at_PreviewEvent; <>PER_t_CurrentUserInitials)
				If ($_l_PreviewRow<1)
					$_l_PreviewRow:=Find in array:C230(SVS_at_PreviewEvent; "Default")
				End if 
				If ($_l_PreviewRow>0)
					If (SVS_at_PreviewEvent{$_l_PreviewRow}="Default")
						$_t_CurrentFormUsage:=DB_t_CurrentFormUsage2
					Else 
						$_t_CurrentFormUsage:=DB_t_CurrentFormUsage2+SVS_at_PreviewEvent{$_l_PreviewRow}
					End if 
					QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_t_CurrentFormUsage)
					vNo:=Records in selection:C76([LIST_LAYOUTS:96])
					SVS_at_PreviewEvent:=$_l_PreviewRow
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Layouts_OutDel"; $_t_oldMethodName)