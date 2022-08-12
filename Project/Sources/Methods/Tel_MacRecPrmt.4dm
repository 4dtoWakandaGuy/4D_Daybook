//%attributes = {}
If (False:C215)
	//Project Method Name:      Tel_MacRecPrmt
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
	C_LONGINT:C283($_l_Clash)
	C_TEXT:C284($_t_oldMethodName; $_t_PictureCode; $_t_PictureName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel_MacRecPrmt")
//Tel_MacRecPrmt - record a prompt & send it to the server
$_t_PictureName:=Gen_Request("Save prompt as")
If (OK=1)
	CREATE RECORD:C68([PICTURES:85])
	
	Repeat 
		$_t_PictureCode:="P"+String:C10(AA_GetNextIDinMethod(->[PICTURES:85]Picture_Code:1; Sequence number:C244([PICTURES:85])))
		SET QUERY DESTINATION:C396(3; $_l_Clash)
		QUERY:C277([PICTURES:85]; [PICTURES:85]Picture_Code:1=$_t_PictureCode)
		SET QUERY DESTINATION:C396(0)
	Until ($_l_Clash=0)
	
	[PICTURES:85]Picture_Code:1:=$_t_PictureCode
	[PICTURES:85]Picture_Name:2:=$_t_PictureName
	Tel_MacRec
	DB_SaveRecord(->[PICTURES:85])
	AA_CheckFileUnlocked(->[PICTURES:85]x_ID:5)
	
	Tel_SrvrSend([PICTURES:85]Picture_Code:1)
End if 
ERR_MethodTrackerReturn("Tel_MacRecPrmt"; $_t_oldMethodName)
