//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_RecordBalance
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:       28/05/2011 13:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; $_l_Retries)
	C_REAL:C285($_r_Balance; $3; $4; $5)
	C_TEXT:C284($_t_oldMethodName; $_t_StructurePath; $1; $2; $6)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_RecordBalance")
$_l_Retries:=0
While (Semaphore:C143("WritingDocument"))
	$_l_Retries:=$_l_Retries+1
	DelayTicks($_l_Retries*2)
End while 

$_t_StructurePath:=StructureFilePath  //Mon, Dec 18, 2006 balinderwalia: changed to work for engine version
//Folder separator:=DB_DirSymbol 

For ($_l_Index; Length:C16($_t_StructurePath); 1; -1)
	If ($_t_StructurePath[[$_l_Index]]=Folder separator:K24:12)
		$_t_StructurePath:=Substring:C12($_t_StructurePath; 1; $_l_Index)
		$_l_Index:=0
	End if 
End for 
$_t_StructurePath:=$_t_StructurePath+"ACCBALANCESHISTORY"+".txt"
If ((Test path name:C476($_t_StructurePath)#Is a document:K24:1))
	$_ti_DocumentRef:=Create document:C266($_t_StructurePath; "TXT")
	SEND PACKET:C103($_ti_DocumentRef; "Date"+Char:C90(9)+"Time"+Char:C90(9)+"Account"+Char:C90(9)+"Change Type"+Char:C90(9)+"amount"+Char:C90(9)+"Balance Before"+Char:C90(9)+"Balance After"+Char:C90(13))
	
	
Else 
	$_ti_DocumentRef:=Append document:C265($_t_StructurePath)
End if 
$_r_Balance:=$4+$3
If ($_r_Balance#$5)
	SEND PACKET:C103($_ti_DocumentRef; String:C10(Current date:C33)+Char:C90(9)+String:C10(Current time:C178)+Char:C90(9)+$1+Char:C90(9)+($2)+Char:C90(9)+String:C10($3)+Char:C90(9)+String:C10($4)+Char:C90(9)+String:C10($5)+Char:C90(9)+$6+Char:C90(9)+"ERROR"+Char:C90(13))
	
Else 
	SEND PACKET:C103($_ti_DocumentRef; String:C10(Current date:C33)+Char:C90(9)+String:C10(Current time:C178)+Char:C90(9)+$1+Char:C90(9)+($2)+Char:C90(9)+String:C10($3)+Char:C90(9)+String:C10($4)+Char:C90(9)+String:C10($5)+Char:C90(9)+$6+Char:C90(13))
End if 
CLOSE DOCUMENT:C267($_ti_DocumentRef)
CLEAR SEMAPHORE:C144("WritingDocument")
ERR_MethodTrackerReturn("ACC_RecordBalance"; $_t_oldMethodName)