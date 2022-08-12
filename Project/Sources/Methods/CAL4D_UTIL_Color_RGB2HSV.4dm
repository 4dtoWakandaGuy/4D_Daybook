//%attributes = {}
If (False:C215)
	//Project Method Name:      CAL4D_UTIL_Color_RGB2HSV
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/12/2009 13:48`Method: CAL4D_UTIL_Color_RGB2HSV
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY REAL:C219($_ar_Values; 0)
	ARRAY TEXT:C222($_at_Names; 0)
	C_LONGINT:C283($_l_Blue; $_l_Green; $_l_HSVh; $_l_HSVs; $_l_HSVv; $_l_Red; $1; $2; $3)
	C_REAL:C285($_r_Blue; $_r_DelBlue; $_r_DelGreen; $_r_DelRed; $_r_Delta; $_r_Green; $_r_HSVh; $_r_HSVs; $_r_HSVv; $_r_Max; $_r_Min)
	C_REAL:C285($_r_Red)
	C_TEXT:C284($_t_HSV; $_t_MethodName; $_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAL4D_UTIL_Color_RGB2HSV")
$_t_MethodName:=Current method name:C684
//=====================    Declare Variables    ==================================
//method_parameters_declarations

//--------------------------------------------------------------------------------
//method_wide_constants_declarations
//--------------------------------------------------------------------------------
//local_variable_declarations


$_l_Red:=$1
$_l_Green:=$2
$_l_Blue:=$3

$_t_HSV:=""

Case of 
	: (($_l_Red<0) | ($_l_Red>255))
		
	: (($_l_Green<0) | ($_l_Green>255))
		
	: (($_l_Blue<0) | ($_l_Blue>255))
		
	Else 
		$_r_Red:=$_l_Red/255
		$_r_Green:=$_l_Green/255
		$_r_Blue:=$_l_Blue/255
		
		ARRAY TEXT:C222($_at_Names; 3)
		ARRAY REAL:C219($_ar_Values; 3)
		$_at_Names{1}:="R"
		$_at_Names{2}:="G"
		$_at_Names{3}:="B"
		$_ar_Values{1}:=$_r_Red
		$_ar_Values{2}:=$_r_Green
		$_ar_Values{3}:=$_r_Blue
		
		SORT ARRAY:C229($_ar_Values; $_at_Names; <)
		$_r_Max:=$_ar_Values{1}
		SORT ARRAY:C229($_ar_Values; $_at_Names; >)
		$_r_Min:=$_ar_Values{1}
		$_r_Delta:=$_r_Max-$_r_Min
		
		$_r_HSVv:=$_r_Max
		
		//========================    Method Actions    ==================================
		
		If ($_r_Delta=0)
			$_r_HSVh:=0
			$_r_HSVs:=0
			
		Else 
			$_r_HSVs:=$_r_Delta/$_r_Max
			$_r_DelRed:=((($_r_Max-$_r_Red)/6)+($_r_Delta/2))/$_r_Delta
			$_r_DelGreen:=((($_r_Max-$_r_Green)/6)+($_r_Delta/2))/$_r_Delta
			$_r_DelBlue:=((($_r_Max-$_r_Blue)/6)+($_r_Delta/2))/$_r_Delta
			
			If ($_r_Red=$_r_Max)
				$_r_HSVh:=$_r_DelBlue-$_r_DelGreen
			Else 
				If ($_r_Green=$_r_Max)
					$_r_HSVh:=(1/3)+$_r_DelRed-$_r_DelBlue
				Else 
					If ($_r_Blue=$_r_Max)
						$_r_HSVh:=(2/3)+$_r_DelGreen-$_r_DelRed
					End if 
				End if 
			End if 
			
			If ($_r_HSVh<0)
				$_r_HSVh:=$_r_HSVh+1
			End if 
			
			If ($_r_HSVh>1)
				$_r_HSVh:=$_r_HSVh-1
			End if 
			
		End if 
		
		//========================    Clean up and Exit    =================================
		
		$_l_HSVh:=$_r_HSVh*360
		$_l_HSVs:=$_r_HSVs*100
		$_l_HSVv:=$_r_HSVv*100
		
		$_t_HSV:=String:C10($_l_HSVh)+","+String:C10($_l_HSVs)+","+String:C10($_l_HSVv)
		
End case 

$0:=$_t_HSV
ERR_MethodTrackerReturn("CAL4D_UTIL_Color_RGB2HSV"; $_t_oldMethodName)