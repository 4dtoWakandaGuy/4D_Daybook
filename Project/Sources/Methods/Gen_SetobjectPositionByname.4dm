//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_SetobjectPositionByname
	//------------------ Method Notes ------------------
	//Similar to Gen_SetobjectPosition..except instead of $1 being a pointer it is an obect name
	//------------------ Revision Control ----------------
	//Date Created: 10/03/2010 10:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_NextObject; $_l_ObjectBottom; $_l_ObjectHeight; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ObjectWidth; $0; $2; $3; $4)
	C_LONGINT:C283($5)
	C_POINTER:C301($6)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_SetobjectPositionByname")
If (Count parameters:C259>=2)
	
	OBJECT GET COORDINATES:C663(*; $1; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	
	$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
	$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
	
	$_l_NextObject:=$2
	If ($_l_NextObject=0)
		$_l_NextObject:=$_l_ObjectTop
	Else 
		$_l_ObjectTop:=$_l_NextObject
	End if 
	If (Count parameters:C259>=3)
		If ($3>0)
			$_l_ObjectLeft:=$3
		End if 
	End if 
	If (Count parameters:C259>=4)
		If ($4>0)
			$_l_ObjectBottom:=$4
			If ($2=0)  //Top was not set so keep height
				$_l_NextObject:=$_l_ObjectBottom-$_l_ObjectHeight
			Else 
				
			End if 
		Else 
			If ($4<0)
				$_l_ObjectBottom:=$_l_ObjectBottom+$4
			End if 
		End if 
	Else 
		//Keep height same
		$_l_ObjectBottom:=$_l_ObjectTop+$_l_ObjectHeight
	End if 
	If (Count parameters:C259>=5)
		If ($5>0)
			$_l_ObjectRight:=$5
			If ($3=0)
				//no left position so keep width
				$_l_ObjectLeft:=$_l_ObjectRight-$_l_ObjectWidth
			End if 
		Else 
			If ($5<0)
				$_l_ObjectLeft:=$_l_ObjectRight+$5
			End if 
			
		End if 
	Else 
		//keep width the same
		$_l_ObjectRight:=$_l_ObjectLeft+$_l_ObjectWidth
	End if 
	$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
	$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
	OBJECT MOVE:C664(*; $1; $_l_ObjectLeft; $_l_NextObject; $_l_ObjectLeft+$_l_ObjectWidth; $_l_NextObject+$_l_ObjectHeight; *)
	If ($2>0)
		$0:=$_l_NextObject+$_l_ObjectHeight
	Else 
		$0:=$_l_NextObject
	End if 
	If (Count parameters:C259>=6)
		If ($3>0)
			$6->:=$_l_ObjectLeft+$_l_ObjectWidth
		Else 
			$6->:=$_l_ObjectLeft
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("Gen_SetobjectPositionByname"; $_t_oldMethodName)