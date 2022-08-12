//%attributes = {}
If (False:C215)
	//Project Method Name:      SVG_PointOnArc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:      26/07/2011 20:00 v8.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Degree; $_l_Left; $_l_Right; $_l_SL2; $_l_Top)
	C_POINTER:C301($4; $5)
	C_REAL:C285($_r_Length; $_r_Sin; $1; $2; $3; $Base; $Hoffset; $voffset)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SVG_PointOnArc")

If ($1>0) & ($2>0)
	$_l_Left:=$1-$2
	Case of 
		: ($3=0)
			$_l_Left:=$2
			$_l_Top:=0
		: ($3<90)
			$_l_Degree:=90-$3
			$_r_Sin:=Sin:C17($_l_Degree*Degree:K30:2)
			$_l_Right:=$2
			$_r_Length:=$_l_Right*$_r_Sin
			$_l_SL2:=($_l_Right*$_l_Right)-($_r_Length*$_r_Length)
			$_l_SL2:=Square root:C539($_l_SL2)
			$_l_Left:=$_l_Right+$_l_SL2
			$_l_Top:=0+($_l_Right-$_r_Length)
		: ($3=90)
			$_l_Left:=$2*2
			$_l_Top:=$2
		: ($3<180)
			$_l_Degree:=90-($3-90)
			$_r_Sin:=Sin:C17($_l_Degree*Degree:K30:2)
			$_l_Right:=$2
			$_r_Length:=$_l_Right*$_r_Sin
			$_l_SL2:=($_l_Right*$_l_Right)-($_r_Length*$_r_Length)
			$_l_SL2:=Square root:C539($_l_SL2)
			
			$_l_Top:=$_l_Right+$_l_SL2
			$_l_Left:=$_l_Right+$_r_Length
		: ($3=180)
			$_l_Left:=$2
			$_l_Top:=$2*2
		: ($3<270)
			$_l_Degree:=90-($3-180)
			$_r_Sin:=Sin:C17($_l_Degree*Degree:K30:2)
			$_l_Right:=$2
			$_r_Length:=$_l_Right*$_r_Sin
			$_l_SL2:=($_l_Right*$_l_Right)-($_r_Length*$_r_Length)
			$_l_SL2:=Square root:C539($_l_SL2)
			$_l_Left:=$_l_Right-$_l_SL2
			$_l_Top:=$_l_Right+$_r_Length
			
		: ($3=270)
			$_l_Left:=0
			$_l_Top:=$2
		: ($3<360)
			$_l_Degree:=90-($3-270)
			$_r_Sin:=Sin:C17($_l_Degree*Degree:K30:2)
			$_l_Right:=$2
			$_r_Length:=$_l_Right*$_r_Sin
			$_l_SL2:=($_l_Right*$_l_Right)-($_r_Length*$_r_Length)
			$_l_SL2:=Square root:C539($_l_SL2)
			$_l_Top:=$_l_Right-$_l_SL2
			$_l_Left:=0+($_l_Right-$_r_Length)
		: ($3=360)
			$_l_Left:=$2
			$_l_Top:=0
	End case 
	$4->:=$_l_Left
	$5->:=$_l_Top
End if 
ERR_MethodTrackerReturn("SVG_PointOnArc"; $_t_oldMethodName)