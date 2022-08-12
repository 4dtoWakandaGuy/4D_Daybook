//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_DelAllElemß
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CountParameters)
	C_POINTER:C301($1; $2; $3; $4; $5)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_DelAllElemß")

//NG 21/7/2006 This method is a replacement for ALDelAllElemß´
$_t_oldMethodName:=ERR_MethodTracker("LBi_DelAllElemß")
//ALDelAllElemß - used in the InLPß procs to delete the rows of other pages' areas
$_l_CountParameters:=Count parameters:C259
If ($_l_CountParameters>0)
	If (Size of array:C274($1->)>0)
		If (Size of array:C274(($1->{3})->)>0)
			LBi_DelAllElem($1)  //in advance because they wouldn't otherwise be refilled when you go to Page_1
		End if 
	End if 
End if 
If ($_l_CountParameters>1)
	If (Size of array:C274($2->)>0)
		If (Size of array:C274(($2->{3})->)>0)
			LBi_DelAllElem($2)
		End if 
	End if 
End if 
If ($_l_CountParameters>2)
	If (Size of array:C274($3->)>0)
		If (Size of array:C274(($3->{3})->)>0)
			LBi_DelAllElem($3)
		End if 
	End if 
End if 
If ($_l_CountParameters>3)
	If (Size of array:C274($4->)>0)
		If (Size of array:C274(($4->{3})->)>0)
			LBi_DelAllElem($4)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("LBi_DelAllElemß"; $_t_oldMethodName)