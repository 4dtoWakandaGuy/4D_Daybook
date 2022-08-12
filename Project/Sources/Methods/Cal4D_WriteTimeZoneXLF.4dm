//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_WriteTimeZoneXLF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 15:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(en)
	//C_UNKNOWN(http)
	//C_UNKNOWN(STR)
	//C_UNKNOWN(TimeZone)
	//C_UNKNOWN(US)
	//C_UNKNOWN(WeekStart)
	//C_UNKNOWN(x)
	C_LONGINT:C283($_l_Params; $_l_WindowRef)
	C_TEXT:C284($_t_Localization; $_t_oldMethodName; $_t_OS; $_t_Path; $_t_WeekStart; $_t_XLIFF; $_t_Zone; $1; $2)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_WriteTimeZoneXLF")


$_t_Zone:=$1
$_t_WeekStart:=$2

//========================    Method Actions    ==================================

$_t_XLIFF:="<!DOCTYPE xliff PUBLIC \"-//XLIFF//DTD XLIFF//EN\"\r"
$_t_XLIFF:=$_t_XLIFF+"\"http://www.oasis-open.org/committees/xliff/documents/xliff.dtd\">\r\r"
$_t_XLIFF:=$_t_XLIFF+"<xliff version=\"1.0\">\r"
$_t_XLIFF:=$_t_XLIFF+"\t<file datatype=\"x-STR#\" source-language=\"en-US\" target-language=\"en-US\" product-version=\"2007\">\r"
$_t_XLIFF:=$_t_XLIFF+"\t\t<header>\r"
$_t_XLIFF:=$_t_XLIFF+"\t\t\t<note>The character &quot;%&quot; (out of a numerical context) is a meta-character that will be replaced (often by a numeric value) before the string is displayed</note>\r"
$_t_XLIFF:=$_t_XLIFF+"\t\t\t<note>Text between less than (&lt;) and greater than (&gt;) symbols is a variable&apos;s name and must not be localised</note>\r"
$_t_XLIFF:=$_t_XLIFF+"\t\t\t<note>\\r, \\t and \\n are meta-characters.</note>\r"
$_t_XLIFF:=$_t_XLIFF+"\t\t</header>\r"
$_t_XLIFF:=$_t_XLIFF+"\t\t<body>\r"
$_t_XLIFF:=$_t_XLIFF+"\t\t\t<group id=\"31000\" resname=\"TimeZone\">\r"
$_t_XLIFF:=$_t_XLIFF+"\t\t\t\t<trans-unit id=\"1\">\r"
$_t_XLIFF:=$_t_XLIFF+"\t\t\t\t\t<source>"+$_t_Zone+"</source>\r"
$_t_XLIFF:=$_t_XLIFF+"\t\t\t\t\t<target>"+$_t_Zone+"</target>\r"
$_t_XLIFF:=$_t_XLIFF+"\t\t\t\t</trans-unit>\r"
$_t_XLIFF:=$_t_XLIFF+"\t\t\t</group>\r"
$_t_XLIFF:=$_t_XLIFF+"\t\t\t<group id=\"32000\" resname=\"WeekStart\">\r"
$_t_XLIFF:=$_t_XLIFF+"\t\t\t\t<trans-unit id=\"1\">\r"
$_t_XLIFF:=$_t_XLIFF+"\t\t\t\t\t<source>"+$_t_WeekStart+"</source>\r"
$_t_XLIFF:=$_t_XLIFF+"\t\t\t\t\t<target>"+$_t_WeekStart+"</target>\r"
$_t_XLIFF:=$_t_XLIFF+"\t\t\t\t</trans-unit>\r"
$_t_XLIFF:=$_t_XLIFF+"\t\t\t</group>\r"
$_t_XLIFF:=$_t_XLIFF+"\t\t</body>\r"
$_t_XLIFF:=$_t_XLIFF+"\t</file>\r"
$_t_XLIFF:=$_t_XLIFF+"</xliff>\r"

$_t_Path:=Get 4D folder:C485(Current resources folder:K5:16; *)
$_t_Localization:=Get database localization:C1009
Case of 
	: ($_t_Localization="en")
		$_t_Path:=$_t_Path+"English.lproj"
	: ($_t_Localization="fr")
		$_t_Path:=$_t_Path+"French.lproj"
	: ($_t_Localization="es")
		$_t_Path:=$_t_Path+"Spanish.lproj"
	Else 
		
End case 

If (Test path name:C476($_t_Path)#Is a folder:K24:2)
	CREATE FOLDER:C475($_t_Path)
End if 

//$_t_OS:=Shell_GetOS
$_t_Path:=$_t_Path+Choose:C955($_t_OS="Win@"; "\\"; ":")

$_ti_DocumentRef:=DB_CreateDocument($_t_Path+"TimeZone.xlf"; "TEXT")
If (OK=1)
	SEND PACKET:C103($_ti_DocumentRef; $_t_XLIFF)
	//_O_SET DOCUMENT CREATOR(Document;"R*ch")  //// Modified by: Charles Vass (03/18/2009, 14:03) Open with BBEdit on a Mac
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
End if 

//========================    Clean up and Exit    =================================
ERR_MethodTrackerReturn("Cal4D_WriteTimeZoneXLF"; $_t_oldMethodName)