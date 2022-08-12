//%attributes = {}
If (False:C215)
	//Project Method Name:      CAL4D_UTIL_Color_HSV2RGB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/12/2009 13:50`Method: CAL4D_UTIL_Color_HSV2RGB
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Blue; $_l_Green; $_l_Hue; $_l_Index; $_l_Red; $_l_Saturation; $_l_Value; $1; $2; $3)
	C_REAL:C285($_r_Hue; $_r_Saturation; $_r_Value; $_r_Var1; $_r_Var2; $_r_Var3; $_r_VarH)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName; $_t_RGB; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAL4D_UTIL_Color_HSV2RGB")

$_l_Hue:=$1
$_l_Saturation:=$2
$_l_Value:=$3
$_t_RGB:=""

Case of 
	: (($_l_Hue<0) | ($_l_Hue>360))
		
	: (($_l_Saturation<0) | ($_l_Saturation>100))
		
	: (($_l_Value<0) | ($_l_Value>100))
		
	Else 
		$_r_Hue:=$_l_Hue/360
		$_r_Saturation:=$_l_Saturation/100
		$_r_Value:=$_l_Value/100
		
		//========================    Method Actions    ==================================
		
		If ($_r_Saturation=0)
			$_l_Red:=$_r_Value*255
			$_l_Green:=$_r_Value*255
			$_l_Blue:=$_r_Value*255
			
		Else 
			$_r_VarH:=$_r_Hue*6
			$_l_Index:=Trunc:C95($_r_VarH; 0)
			$_r_Var1:=$_r_Value*(1-$_r_Saturation)
			$_r_Var2:=$_r_Value*(1-($_r_Saturation*($_r_VarH-$_l_Index)))
			$_r_Var3:=$_r_Value*(1-($_r_Saturation*(1-($_r_VarH-$_l_Index))))
			
			Case of 
				: ($_l_Index=0)
					$_l_Red:=Round:C94($_r_Value*255; 0)
					$_l_Green:=Round:C94($_r_Var3*255; 0)
					$_l_Blue:=Round:C94($_r_Var1*255; 0)
					
				: ($_l_Index=1)
					$_l_Red:=Round:C94($_r_Var2*255; 0)
					$_l_Green:=Round:C94($_r_Value*255; 0)
					$_l_Blue:=Round:C94($_r_Var1*255; 0)
					
				: ($_l_Index=2)
					$_l_Red:=Round:C94($_r_Var1*255; 0)
					$_l_Green:=Round:C94($_r_Value*255; 0)
					$_l_Blue:=Round:C94($_r_Var3*255; 0)
					
				: ($_l_Index=3)
					$_l_Red:=Round:C94($_r_Var1*255; 0)
					$_l_Green:=Round:C94($_r_Var2*255; 0)
					$_l_Blue:=Round:C94($_r_Value*255; 0)
					
				: ($_l_Index=4)
					$_l_Red:=Round:C94($_r_Var3*255; 0)
					$_l_Green:=Round:C94($_r_Var1*255; 0)
					$_l_Blue:=Round:C94($_r_Value*255; 0)
					
				Else 
					$_l_Red:=Round:C94($_r_Value*255; 0)
					$_l_Green:=Round:C94($_r_Var1*255; 0)
					$_l_Blue:=Round:C94($_r_Var2*255; 0)
					
			End case 
			
		End if 
		
		//========================    Clean up and Exit    =================================
		
		$_t_RGB:=String:C10($_l_Red)+","+String:C10($_l_Green)+","+String:C10($_l_Blue)
End case 

$0:=$_t_RGB
ERR_MethodTrackerReturn("CAL4D_UTIL_Color_HSV2RGB"; $_t_oldMethodName)