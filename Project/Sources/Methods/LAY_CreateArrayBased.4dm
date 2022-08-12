//%attributes = {}

If (False:C215)
	//Project Method Name:      LAY_CreateArrayBased
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
	C_BOOLEAN:C305($7; $8)
	C_LONGINT:C283($_l_ColumnNumber; $10; $12; $5; $6)
	C_REAL:C285($0)
	C_TEXT:C284($_t_oldMethodName; $1; $11; $2; $3; $4; $9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LAY_CreateArrayBased")


//NG this method is based on Layouts_Create. It is so we have a new type of list layout record.
//in this the pararamter 2 and 3 are replaced with a string being the array name

If ($6>0)  //NG added section to make sure column number is not clashing..
	$_l_ColumnNumber:=$6
Else 
	$_l_ColumnNumber:=1
End if 
Repeat 
	QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$1; *)
	QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Order:7=$_l_ColumnNumber)
	If (Records in selection:C76([LIST_LAYOUTS:96])>0)
		$_l_ColumnNumber:=$_l_ColumnNumber+1
	End if 
Until (Records in selection:C76([LIST_LAYOUTS:96])=0)
CREATE RECORD:C68([LIST_LAYOUTS:96])
[LIST_LAYOUTS:96]Layout_Reference:1:=$1
[LIST_LAYOUTS:96]X_associatedArrayName:17:=$2
[LIST_LAYOUTS:96]Title:4:=$3
[LIST_LAYOUTS:96]Format:6:=$4
[LIST_LAYOUTS:96]Width:5:=$5
[LIST_LAYOUTS:96]Order:7:=$_l_ColumnNumber
$0:=$_l_ColumnNumber
[LIST_LAYOUTS:96]Enterable:8:=$7
If (Count parameters:C259>=8)
	[LIST_LAYOUTS:96]Locked:10:=$8
End if 
If (Count parameters:C259>=9)
	[LIST_LAYOUTS:96]Formula:9:=$9
End if 
If (Count parameters:C259>=10)
	If ($10=0)
		[LIST_LAYOUTS:96]Font_Size:11:=9
	Else 
		[LIST_LAYOUTS:96]Font_Size:11:=$10
	End if 
Else 
	[LIST_LAYOUTS:96]Font_Size:11:=9
End if 
If (Count parameters:C259>=11)
	If ($11="")
		[LIST_LAYOUTS:96]Colour:12:="Black"
	Else 
		[LIST_LAYOUTS:96]Colour:12:=$11
	End if 
Else 
	[LIST_LAYOUTS:96]Colour:12:="Black"
End if 
If (Count parameters:C259>=12)
	[LIST_LAYOUTS:96]Footer:14:=$12
Else 
	[LIST_LAYOUTS:96]Footer:14:=1
End if 
Layouts_Setting
DB_SaveRecord(->[LIST_LAYOUTS:96])
QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$1)
ORDER BY:C49([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Order:7; <)
$0:=([LIST_LAYOUTS:96]Order:7)+1
ERR_MethodTrackerReturn("LAY_CreateArrayBased"; $_t_oldMethodName)