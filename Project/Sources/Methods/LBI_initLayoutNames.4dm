//%attributes = {}
If (False:C215)
	//Project Method Name:      LBI_initLayoutNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/09/2012 06:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_LayoutReferences; 0)
	C_LONGINT:C283($_l_index)
	C_POINTER:C301($_ptr_LayoutReferences; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBI_initLayoutNames")
If (Count parameters:C259>=2)
	$_ptr_LayoutReferences:=$1
Else 
	ARRAY TEXT:C222($_at_LayoutReferences; 0)
	$_ptr_LayoutReferences:=->$_at_LayoutReferences
End if 
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "00103")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "00104")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "00105")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "14405")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "00201")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "00202")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "00203")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "14601")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "00204")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "14601")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "14803")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "00301")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "00401")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "00601")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "00701")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "00801")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "00904")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "00905")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "01001")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "01101")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "01203")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "01208")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "01209")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "01210")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "01211")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "01213")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "01214")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "01215")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "01301")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "01401")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "01702")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "01703")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "01801")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "01901")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02002")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02003")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02301")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02403")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02408")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02409")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02410")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02411")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02412")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02503")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02504")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02505")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02506")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02507")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02508")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02509")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02510")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02511")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02512")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02520")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02521")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02522")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02523")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02602")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02603")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02604")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02701")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02702")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02714")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02703")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02704")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02705")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02706")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02707")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02708")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02709")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02710")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02711")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02714")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "14301")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02201")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02807")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02809")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02901")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "02902")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "03003")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "03004")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "03101")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "03301")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "03401")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "03501")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "03601")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "03703")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "03704")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "03706")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "03707")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "03708")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "03801")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "04001")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "04501")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "15803")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "15804")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "03704")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "16103")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "16104")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "03906")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "03907")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "03908")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "03909")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "03910")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "03911")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "03912")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "03999")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "04601")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "04704")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "04705")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "04706")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "04801")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "04802")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "05001")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "05101")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "05201")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "05303")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "05401")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "05502")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "05503")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "05703")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "16903")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "16904")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "05705")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "05706")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "05707")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "05801")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "05901")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "06001")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "06101")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "06201")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "06202")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "06501")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "07101")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "07301")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "07401")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "07501")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "07601")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "08001")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "08501")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "08401")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "08701")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "08901")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "09201")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "09301")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "09801")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "09903")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "09904")
APPEND TO ARRAY:C911($_ptr_LayoutReferences->; "00501")
If (Count parameters:C259=0)
	For ($_l_index; 1; Size of array:C274($_at_LayoutReferences))
		LBI_saveLayoutName($_at_LayoutReferences{$_l_index})
		
	End for 
End if 
ERR_MethodTrackerReturn("LBI_initLayoutNames"; $_t_oldMethodName)