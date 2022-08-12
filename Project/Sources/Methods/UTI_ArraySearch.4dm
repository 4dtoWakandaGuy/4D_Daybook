//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_ArraySearch
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
	C_LONGINT:C283($_l_HightPoint; $_l_LowPoint; $_l_MidPoint; $_l_Parameters; $_l_SIzeofArray; $0)
	C_POINTER:C301($_ptr_Array; $_ptr_Counter; $_ptr_Value; $1; $2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_ArraySearch")
//(P)UTI_ArraySearch(Pointer;Pointer;{Pointer}) -> longint

//$1 is pointer to sorted array
//$2 is pointer to variable/field containing value to search for
//$0 is longint variable to contain no. of 1st matching el.
//If no matching element is found, returns a negative number
//whose Abs value is the position to insert a new element
//to contain the value
//$3 (optional) is -> longint var to contain number of matching elements
//looks for a value(target) in a sorted array
//returns element # of first match, plus (optionally) number of matches
//e.g. $Find:=UTI_ArraySearch (->BDL_at_BundleName;->BDL_s_Name;->iCount)

//This is fully bounds-checked, so we can use JPR's technique to switch
//off range-checking

// % R - (remove spaces & this comment to enable) ``Axel enabled 07/26/2000
// % R -

If (Count parameters:C259>=2)
	$_l_Parameters:=Count parameters:C259  // Axel 08/01/2000
	$_ptr_Array:=$1
	$_ptr_Value:=$2
	If ($_l_Parameters=3)
		$_ptr_Counter:=$3
	End if 
	$_l_SIzeofArray:=Size of array:C274($_ptr_Array->)
	If ($_l_SIzeofArray>0)
		$_l_LowPoint:=0  //lower boundary of range
		$_l_HightPoint:=$_l_SIzeofArray+1  //Upper boundary of range
		
		While (($_l_LowPoint+1)#$_l_HightPoint)  //while range contains elements
			
			$_l_MidPoint:=($_l_LowPoint+$_l_HightPoint)\2  //calc midpoint of the range
			If ($_ptr_Array->{$_l_MidPoint}<$_ptr_Value->)  //if value at midpoint
				$_l_LowPoint:=$_l_MidPoint  //reset lower boundary to midpoint
			Else 
				$_l_HightPoint:=$_l_MidPoint  //reset upper boundary to midpoint
			End if 
		End while 
		Case of   //***
			: ($_l_HightPoint>$_l_SIzeofArray)  //empty array or target value >value of last element
				//must check this first to avoid range check errors ***
				$0:=0-($_l_SIzeofArray+1)
				If ($_l_Parameters=3)
					$_ptr_Counter->:=0
				End if 
			: ($_ptr_Array->{$_l_HightPoint}=$_ptr_Value->)  //exact match (most likely, so check next) ***
				$0:=$_l_HightPoint  //return element # of first match
				If ($_l_Parameters=3)
					//Now repeat (slightly amended) to find highest matching value
					$_l_LowPoint:=$0  //set found element to be bottom of search range
					$_l_HightPoint:=$_l_SIzeofArray+1  //Upper boundary of range
					While (($_l_LowPoint+1)#$_l_HightPoint)  //while range contains elements
						
						$_l_MidPoint:=($_l_LowPoint+$_l_HightPoint)\2  //calc midpoint of the range
						If ($_ptr_Array->{$_l_MidPoint}>$_ptr_Value->)  //if value at midpoint >  target value ***
							$_l_HightPoint:=$_l_MidPoint  //reset upper boundary to midpoint *** put most frequent  first
						Else   //value at midpoint must = target value
							$_l_LowPoint:=$_l_MidPoint  //reset lower boundary to midpoint
						End if 
					End while   //$_l_HightPoint is now element # after last matching element ***
					$_ptr_Counter->:=$_l_HightPoint-$0  //returns no. of matching elements (using $_l_HightPoint saves adding  1)
				End if 
			Else   //not exact match
				$0:=0-$_l_HightPoint
				If ($_l_Parameters=3)
					$_ptr_Counter->:=0
				End if 
		End case 
	Else 
		$0:=-1
		If ($_l_Parameters=3)
			$_ptr_Counter->:=0
		End if 
	End if 
End if 
//% R +  ` don't turn it back on
ERR_MethodTrackerReturn("UTI_ArraySearch"; $_t_oldMethodName)
