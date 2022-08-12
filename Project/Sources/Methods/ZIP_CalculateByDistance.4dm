//%attributes = {}
If (False:C215)
	//Project Method Name:      ZIP_CalculateByDistance
	//------------------ Method Notes ------------------
	//THis method will calculate the long and lat values for a given distance(Miles) from a starting point.
	
	//------------------ Revision Control ----------------
	//Date Created: 04/07/2010 18:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($5; $6; $7; $8; $9)
	C_REAL:C285($_r_Distance; $_r_Factor; $_r_IncPerMile; $_r_Increment; $_r_Latitude1; $_r_Latitude2; $_r_Latitude2OLD; $_r_Latitude2Start; $_r_Longitude1; $_r_Longitude2; $_r_Miles)
	C_REAL:C285($_r_Value; $_r_xCalculation; $_r_xCalculation^2; $2; $3; $4)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZIP_CalculateByDIstance")
//C_REAL($0;$1;$2;$3;$4;$_r_xCalculation;$y;$_r_Longitude1;$_r_Longitude2;$_r_Latitude1;$_r_Latitude2;$_r_Value)
If ($1#"")
	If ($2=0) & ($3=0)
		//ZIP_GetLongandLat
	Else 
		$_r_Latitude1:=$2
		$_r_Longitude1:=$3
	End if 
Else 
	$_r_Latitude1:=$2
	$_r_Longitude1:=$3
End if 
$_r_Miles:=$4

//$_r_Latitude2:=$3
//$_r_Longitude2:=$4
// 3. Most accurate
//Go North
$_r_IncPerMile:=0.0144577
$_r_Increment:=$_r_Miles*$_r_IncPerMile

$_r_Latitude2:=$_r_Latitude1
$_r_Longitude2:=$_r_Longitude1
$_r_Latitude2Start:=$_r_Latitude2
$_r_Factor:=1
Repeat 
	$_r_Latitude2OLD:=$_r_Latitude2
	$_r_Latitude2:=$_r_Latitude2-$_r_Increment
	Repeat 
		$_r_xCalculation:=Sin:C17($_r_Latitude1/57.2958)*Sin:C17($_r_Latitude2/57.2958)
		$_r_xCalculation:=$_r_xCalculation+(Cos:C18($_r_Latitude1/57.2958)*Cos:C18($_r_Latitude2/57.2958)*Cos:C18(($_r_Longitude2/57.2958)-($_r_Longitude1/57.2958)))
		$_r_Value:=Square root:C539(1-($_r_xCalculation^2))/$_r_xCalculation
		$_r_Value:=Arctan:C20($_r_Value)
		$_r_Distance:=3963*$_r_Value
		$_r_Distance:=Round:C94($_r_Distance; 4)
		
		If ($_r_Distance<$_r_Miles)
			$_r_Latitude2:=$_r_Latitude2-$_r_Increment
		End if 
	Until ($_r_Distance>=$_r_Miles)
	If ($_r_Distance#$_r_Miles)
		$_r_Latitude2:=$_r_Latitude2+$_r_Increment
		If ($_r_Latitude2Start=$_r_Latitude2)
			If (($_r_Increment-$_r_Factor)<=0)
				$_r_Factor:=$_r_Factor/10
				$_r_Increment:=$_r_Increment-$_r_Factor
			Else 
				$_r_Increment:=$_r_Increment-$_r_Factor
			End if 
			
		Else 
			$_r_Latitude2Start:=$_r_Latitude2
		End if 
	End if 
Until ($_r_Distance=$_r_Miles)

$5->:=$_r_Latitude2
If (Count parameters:C259>=6)
	
	$_r_Increment:=$_r_Miles*$_r_IncPerMile
	
	$_r_Latitude2:=$_r_Latitude1
	$_r_Longitude2:=$_r_Longitude1
	$_r_Latitude2Start:=$_r_Latitude2
	$_r_Factor:=1
	Repeat 
		$_r_Latitude2OLD:=$_r_Latitude2
		$_r_Latitude2:=$_r_Latitude2+$_r_Increment
		Repeat 
			$_r_xCalculation:=Sin:C17($_r_Latitude1/57.2958)*Sin:C17($_r_Latitude2/57.2958)
			$_r_xCalculation:=$_r_xCalculation+(Cos:C18($_r_Latitude1/57.2958)*Cos:C18($_r_Latitude2/57.2958)*Cos:C18(($_r_Longitude2/57.2958)-($_r_Longitude1/57.2958)))
			$_r_Value:=Square root:C539(1-($_r_xCalculation^2))/$_r_xCalculation
			$_r_Value:=Arctan:C20($_r_Value)
			$_r_Distance:=3963*$_r_Value
			$_r_Distance:=Round:C94($_r_Distance; 4)
			
			If ($_r_Distance<$_r_Miles)
				$_r_Latitude2:=$_r_Latitude2+$_r_Increment
			End if 
		Until ($_r_Distance<=$_r_Miles)
		If ($_r_Distance#$_r_Miles)
			$_r_Latitude2:=$_r_Latitude2-$_r_Increment
			If ($_r_Latitude2Start=$_r_Latitude2)
				If (($_r_Increment-$_r_Factor)<=0)
					$_r_Factor:=$_r_Factor/10
					$_r_Increment:=$_r_Increment+$_r_Factor
				Else 
					$_r_Increment:=$_r_Increment+$_r_Factor
				End if 
				
			Else 
				$_r_Latitude2Start:=$_r_Latitude2
			End if 
		End if 
	Until ($_r_Distance=$_r_Miles)
End if 
ERR_MethodTrackerReturn("ZIP_CalculateByDIstance"; $_t_oldMethodName)