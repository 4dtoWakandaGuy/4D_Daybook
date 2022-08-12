//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_DIFFSMS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  06/12/2010 11:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue; $_bo_overlap; $_l_DeltaOLD)
	C_LONGINT:C283($_l_Delta; $_l_DownK; $_l_DownOffset; $_l_IndexD; $_l_IndexK; $_l_IndexX; $_l_IndexY; $_l_LowerA; $_l_LowerB; $_l_Max; $_l_MaxD)
	C_LONGINT:C283($_l_SizeofArrayA; $_l_SizeofArrayB; $_l_UpK; $_l_UpOffset; $_l_UpperA; $_l_UpperB; $2; $3; $5; $6)
	C_POINTER:C301($_ptr_DataA; $_ptr_DataB; $_ptr_DownVector; $_ptr_UpVector; $_ptr_x; $_ptr_y; $1; $10; $4; $7; $8)
	C_POINTER:C301($9)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_DIFFSMS")

// ----------------------------------------------------
// User name (OS): ddancy
// Date and time: 18/02/08, 12:37:20
// ----------------------------------------------------
// Method: _DIFF_SMS
// Description
//
//
// Parameters
// ----------------------------------------------------
//DONE

$_ptr_DataA:=$1
$_l_LowerA:=$2
$_l_UpperA:=$3
$_ptr_DataB:=$4
$_l_LowerB:=$5
$_l_UpperB:=$6
$_ptr_DownVector:=$7
$_ptr_UpVector:=$8
$_ptr_x:=$9
$_ptr_y:=$10

$_l_SizeofArrayA:=Size of array:C274($_ptr_DataA->)+1
$_l_SizeofArrayB:=Size of array:C274($_ptr_DataB->)+1

$_l_Max:=$_l_SizeofArrayA+$_l_SizeofArrayB+1

$_l_DownK:=$_l_LowerA-$_l_LowerB
$_l_UpK:=$_l_UpperA-$_l_UpperB

$_l_Delta:=($_l_UpperA-$_l_LowerA)-($_l_UpperB-$_l_LowerB)
$_l_DeltaOLD:=($_l_Delta%2#0)

$_l_DownOffset:=$_l_Max-$_l_DownK
$_l_UpOffset:=$_l_Max-$_l_UpK

$_l_MaxD:=(($_l_UpperA-$_l_LowerA+$_l_UpperB-$_l_LowerB)/2)+1

//_DBG_WriteLine("SMS: "+_PText("Search the box: A[%1-%2] to B[%3-%4]";String($_l_LowerA);String($_l_UpperA);String($_l_LowerB);String($_l_UpperB)))

$_ptr_DownVector->{$_l_DownOffset+$_l_DownK+1}:=$_l_LowerA
$_ptr_UpVector->{$_l_UpOffset+$_l_UpK-1}:=$_l_UpperA


$_bo_overlap:=False:C215

For ($_l_IndexD; 0; $_l_MaxD)
	
	If (Not:C34($_bo_overlap))
		
		For ($_l_IndexK; $_l_DownK-$_l_IndexD; $_l_DownK+$_l_IndexD; 2)
			//_DBG_WriteLine("SMS: "+"extend forward path "+String($_l_IndexK))
			
			If ($_l_IndexK=($_l_DownK-$_l_IndexD))
				$_l_IndexX:=$_ptr_DownVector->{$_l_DownOffset+$_l_IndexK+1}  //step down
			Else 
				$_l_IndexX:=$_ptr_DownVector->{$_l_DownOffset+$_l_IndexK-1}+1  //step right
				If (($_l_IndexK<($_l_DownK+$_l_IndexD)) & ($_ptr_DownVector->{$_l_DownOffset+$_l_IndexK+1}>=$_l_IndexX))
					$_l_IndexX:=$_ptr_DownVector->{$_l_DownOffset+$_l_IndexK+1}  //step down instead
				End if 
			End if 
			
			$_l_IndexY:=$_l_IndexX-$_l_IndexK
			
			$_bo_Continue:=True:C214
			While ($_bo_Continue)
				If (($_l_IndexX<$_l_UpperA) & ($_l_IndexY<$_l_UpperB))
					If (($_ptr_DataA->{$_l_IndexX}=$_ptr_DataB->{$_l_IndexY}))
						$_l_IndexX:=$_l_IndexX+1
						$_l_IndexY:=$_l_IndexY+1
					Else 
						$_bo_Continue:=False:C215
					End if 
				Else 
					$_bo_Continue:=False:C215
				End if 
			End while 
			
			$_ptr_DownVector->{$_l_DownOffset+$_l_IndexK}:=$_l_IndexX
			
			If (($_l_DeltaOLD) & (($_l_UpK-$_l_IndexD)<$_l_IndexK) & ($_l_IndexK<($_l_UpK+$_l_IndexD)))
				If ($_ptr_UpVector->{$_l_UpOffset+$_l_IndexK}<=$_ptr_DownVector->{$_l_DownOffset+$_l_IndexK})
					
					$_ptr_x->:=$_ptr_DownVector->{$_l_DownOffset+$_l_IndexK}
					$_ptr_y->:=$_ptr_DownVector->{$_l_DownOffset+$_l_IndexK}-$_l_IndexK
					$_bo_overlap:=True:C214
					
				End if 
				
			End if 
			
			If ($_bo_overlap)
				$_l_IndexK:=$_l_DownK+$_l_IndexD
			End if 
			
		End for 
		
	End if 
	
	If (Not:C34($_bo_overlap))
		
		For ($_l_IndexK; $_l_UpK-$_l_IndexD; $_l_UpK+$_l_IndexD; 2)
			//_DBG_WriteLine("SMS: "+"extend reverse path "+String($_l_IndexK))
			
			If ($_l_IndexK=($_l_UpK+$_l_IndexD))
				$_l_IndexX:=$_ptr_UpVector->{$_l_UpOffset+$_l_IndexK-1}  //step up
			Else 
				$_l_IndexX:=$_ptr_UpVector->{$_l_UpOffset+$_l_IndexK+1}-1  //step left
				If (($_l_IndexK>($_l_UpK-$_l_IndexD)) & ($_ptr_UpVector->{$_l_UpOffset+$_l_IndexK-1}<$_l_IndexX))
					$_l_IndexX:=$_ptr_UpVector->{$_l_UpOffset+$_l_IndexK-1}  //step up instead
				End if 
			End if 
			
			$_l_IndexY:=$_l_IndexX-$_l_IndexK
			
			$_bo_Continue:=True:C214
			While ($_bo_Continue)
				If (($_l_IndexX>$_l_LowerA) & ($_l_IndexY>$_l_LowerB))
					If (($_ptr_DataA->{$_l_IndexX-1}=$_ptr_DataB->{$_l_IndexY-1}))
						$_l_IndexX:=$_l_IndexX-1
						$_l_IndexY:=$_l_IndexY-1
					Else 
						$_bo_Continue:=False:C215
					End if 
				Else 
					$_bo_Continue:=False:C215
				End if 
			End while 
			
			$_ptr_UpVector->{$_l_UpOffset+$_l_IndexK}:=$_l_IndexX
			
			If ((Not:C34($_l_DeltaOLD)) & (($_l_DownK-$_l_IndexD)<=$_l_IndexK) & ($_l_IndexK<=($_l_DownK+$_l_IndexD)))
				If ($_ptr_UpVector->{$_l_UpOffset+$_l_IndexK}<=$_ptr_DownVector->{$_l_DownOffset+$_l_IndexK})
					
					$_ptr_x->:=$_ptr_DownVector->{$_l_DownOffset+$_l_IndexK}
					$_ptr_y->:=$_ptr_DownVector->{$_l_DownOffset+$_l_IndexK}-$_l_IndexK
					$_bo_overlap:=True:C214
					
				End if 
				
			End if 
			
			If ($_bo_overlap)
				$_l_IndexK:=$_l_UpK+$_l_IndexD
			End if 
			
		End for 
		
	End if 
	
	If ($_bo_overlap)
		$_l_IndexD:=$_l_MaxD
	End if 
	
End for 

If (Not:C34($_bo_overlap))
	//ALERT("No overlap")
End if 
ERR_MethodTrackerReturn("DB_DIFFSMS"; $_t_oldMethodName)