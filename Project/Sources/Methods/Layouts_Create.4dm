//%attributes = {}
If (False:C215)
	//Project Method Name:      Layouts_Create
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/08/2012 23:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($8; $9)
	C_LONGINT:C283($_l_ColumnNumber; $_l_RelatedFieldNumber; $_l_RelatedTableNumber; $0; $11; $13; $14; $15; $2; $3; $6)
	C_LONGINT:C283($7)
	C_TEXT:C284($_t_oldMethodName; $1; $10; $12; $4; $5)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Layouts_Create")
If ($7>0)  //NG added section to make sure column number is not clashing..
	$_l_ColumnNumber:=$7
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
[LIST_LAYOUTS:96]Table_Number:2:=$2
[LIST_LAYOUTS:96]Field_Number:3:=$3
[LIST_LAYOUTS:96]Title:4:=$4
[LIST_LAYOUTS:96]Format:6:=$5
[LIST_LAYOUTS:96]Width:5:=$6
[LIST_LAYOUTS:96]Order:7:=$_l_ColumnNumber
[LIST_LAYOUTS:96]Enterable:8:=$8
If (Count parameters:C259>8)
	[LIST_LAYOUTS:96]Locked:10:=$9
End if 
If (Count parameters:C259>9)
	[LIST_LAYOUTS:96]Formula:9:=$10
End if 
If (Count parameters:C259>10)
	If ($11=0)
		[LIST_LAYOUTS:96]Font_Size:11:=12
	Else 
		[LIST_LAYOUTS:96]Font_Size:11:=$11
	End if 
Else 
	[LIST_LAYOUTS:96]Font_Size:11:=12
End if 
If (Count parameters:C259>11)
	If ($12="")
		[LIST_LAYOUTS:96]Colour:12:="Black"
	Else 
		[LIST_LAYOUTS:96]Colour:12:=$12
	End if 
Else 
	[LIST_LAYOUTS:96]Colour:12:="Black"
End if 
If (Count parameters:C259>12)
	[LIST_LAYOUTS:96]Footer:14:=$13
Else 
	[LIST_LAYOUTS:96]Footer:14:=1
End if 
If (Count parameters:C259>=15)  //Show data from another table(used for subtable areas)
	$_l_RelatedTableNumber:=$14
	$_l_RelatedFieldNumber:=$15
	[LIST_LAYOUTS:96]X_Related_Field:16:=$_l_RelatedFieldNumber
	[LIST_LAYOUTS:96]X_Related_Table:15:=$_l_RelatedTableNumber
End if 
Layouts_Setting
DB_SaveRecord(->[LIST_LAYOUTS:96])
//Return the highest column+1(the next column number
QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$1)
ORDER BY:C49([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Order:7; <)
$0:=([LIST_LAYOUTS:96]Order:7)+1
ERR_MethodTrackerReturn("Layouts_Create"; $_t_oldMethodName)