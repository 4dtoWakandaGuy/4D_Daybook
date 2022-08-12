//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_SETOBJECTPOSITION
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
	C_LONGINT:C283($_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $2; $3; $4; $5)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_SETOBJECTPOSITION")
//THIS METHOD WILL SET AN OBJECTS POSITION
//PASS THE  FOLLOWING
//$1=name of object

//$2-LEFT
//$3-TOP
//$4-RIGHT
//$5-BOTTOM
OBJECT GET COORDINATES:C663(*; $1; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
If ($_l_ObjectLeft#$2)
	//CHANGE THE LEFT POSITION
	Case of 
		: ($_l_ObjectLeft>$2)
			OBJECT MOVE:C664(*; $1; -($_l_ObjectLeft-$2); 0; 0; 0)
			//shift left
		: ($_l_ObjectLeft>$2)  //shift right
			OBJECT MOVE:C664(*; $1; ($2-$_l_ObjectLeft); 0; 0; 0)
	End case 
	
End if 
OBJECT GET COORDINATES:C663(*; $1; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
If ($_l_ObjectRight#$4)
	//CHANGE THE RIGHT POSITION
	Case of 
		: ($_l_ObjectRight>$4)
			OBJECT MOVE:C664(*; $1; 0; 0; -($_l_ObjectRight-$4); 0)
			//shift left
		: ($_l_ObjectRight<$4)  //shift right
			OBJECT MOVE:C664(*; $1; 0; 0; ($4-$_l_ObjectRight); 0)
	End case 
	
End if 
OBJECT GET COORDINATES:C663(*; $1; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
If ($_l_ObjectTop#$3)
	//CHANGE THE TOP POSITION-keep size same
	Case of 
		: ($_l_ObjectTop>$3)  //move up
			OBJECT MOVE:C664(*; $1; 0; -($_l_ObjectTop-$3); 0; 0)
			//shift left
		: ($_l_ObjectTop<$3)  //move down
			OBJECT MOVE:C664(*; $1; 0; ($3-$_l_ObjectTop); 0; 0)
	End case 
	
End if 
OBJECT GET COORDINATES:C663(*; $1; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
If ($_l_ObjectBottom#$5)
	//CHANGE THE RIGHT POSITION-keep size same
	Case of 
		: ($_l_ObjectBottom>$5)  //move up
			OBJECT MOVE:C664(*; $1; 0; 0; 0; -($_l_ObjectBottom-$5))
			//shift left
		: ($_l_ObjectBottom<$5)  //move down
			OBJECT MOVE:C664(*; $1; 0; 0; 0; ($5-$_l_ObjectBottom))
	End case 
	
End if 
ERR_MethodTrackerReturn("SM_SETOBJECTPOSITION"; $_t_oldMethodName)
