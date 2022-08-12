//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_DIFFLCS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  06/12/2010 11:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue)
	C_LONGINT:C283($_l_LowerA; $_l_LowerB; $_l_UpperA; $_l_UpperB; $3; $4; $7; $8; $X; $Y)
	C_POINTER:C301($_ptr_DataA; $_ptr_DataB; $_ptr_DownVector; $_ptr_ModA; $_ptr_ModB; $_ptr_UpVector; $1; $10; $2; $5; $6)
	C_POINTER:C301($9)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_DIFFLCS")
// ----------------------------------------------------
// User name (OS): ddancy
// Date and time: 18/02/08, 12:18:07
// ----------------------------------------------------
// Method: _DIFF_LCS
// Description
//
//
// Parameters
// ----------------------------------------------------

$_ptr_DataA:=$1
$_ptr_ModA:=$2
$_l_LowerA:=$3
$_l_UpperA:=$4
$_ptr_DataB:=$5
$_ptr_ModB:=$6
$_l_LowerB:=$7
$_l_UpperB:=$8
$_ptr_DownVector:=$9
$_ptr_UpVector:=$10

//_DBG_WriteLine("LCS: "+_PText("Analyse the box: A[%1-%2] to B[%3-%4]";String($_l_LowerA);String($_l_UpperA);String($_l_LowerB);String($_l_UpperB)))

//Walk through equal lines at start and end
$_bo_Continue:=True:C214
While ($_bo_Continue)
	If (($_l_LowerA<$_l_UpperA) & ($_l_LowerB<$_l_UpperB))
		If (($_ptr_DataA->{$_l_LowerA}=$_ptr_DataB->{$_l_LowerB}))
			$_l_LowerA:=$_l_LowerA+1
			$_l_LowerB:=$_l_LowerB+1
		Else 
			$_bo_Continue:=False:C215
		End if 
	Else 
		$_bo_Continue:=False:C215
	End if 
End while 

$_bo_Continue:=True:C214
While ($_bo_Continue)
	If (($_l_LowerA<$_l_UpperA) & ($_l_LowerB<$_l_UpperB))
		If (($_ptr_DataA->{$_l_UpperA-1}=$_ptr_DataB->{$_l_UpperB-1}))
			$_l_UpperA:=$_l_UpperA-1
			$_l_UpperB:=$_l_UpperB-1
		Else 
			$_bo_Continue:=False:C215
		End if 
	Else 
		$_bo_Continue:=False:C215
	End if 
End while 

Case of 
	: ($_l_LowerA=$_l_UpperA)
		While ($_l_LowerB<$_l_UpperB)
			$_ptr_ModB->{$_l_LowerB}:=True:C214
			$_l_LowerB:=$_l_LowerB+1
		End while 
		
	: ($_l_LowerB=$_l_UpperB)
		While ($_l_LowerA<$_l_UpperA)
			$_ptr_ModA->{$_l_LowerA}:=True:C214
			$_l_LowerA:=$_l_LowerA+1
		End while 
		
	Else 
		
		
		DB_DIFFSMS($_ptr_DataA; $_l_LowerA; $_l_UpperA; $_ptr_DataB; $_l_LowerB; $_l_UpperB; $_ptr_DownVector; $_ptr_UpVector; ->$X; ->$Y)
		//_DBG_WriteLine("MiddleSnakeData: "+_PText("%1,%2";String($X);String($Y)))
		
		DB_DIFFLCS($_ptr_DataA; $_ptr_ModA; $_l_LowerA; $X; $_ptr_DataB; $_ptr_ModB; $_l_LowerB; $Y; $_ptr_DownVector; $_ptr_UpVector)
		DB_DIFFLCS($_ptr_DataA; $_ptr_ModA; $X; $_l_UpperA; $_ptr_DataB; $_ptr_ModB; $Y; $_l_UpperB; $_ptr_DownVector; $_ptr_UpVector)
		
		
End case 
ERR_MethodTrackerReturn("DB_DIFFLCS"; $_t_oldMethodName)