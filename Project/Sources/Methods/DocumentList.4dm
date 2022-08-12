//%attributes = {}
If (False:C215)
	//Project Method Name:      DocumentList
	//------------------ Method Notes ------------------
	//BSW 13/02/03
	//4D command get Document list into array but they are sorted by name
	// This Method get document list into the passed array
	//  It allows to sort document by most recently created documents/modified
	//Optionally you can get rid of invisibe and/or locked documents from the doc list
	//$1 path name from where to get docs (Var 255 chars)
	
	//$2 pointer to process or interProcess_Array to populate doc names
	//(type must be 255 chars)
	
	//$3 Sort by - Optional Long Integer (Default - 0 Sort by doc names,pass 1 to Sort
	//by created date and Time, pass 2 to sort by modified date and time)
	
	//$4 DocumentOptions_l - Optional Long Integer - (Default - 0 means leave invisibl
	//and locked docs in array, pass 1 to get rid of invisible docs, pass 2 to get rid
	//of locked and pass 3 to get rid of both locked and invisibles)
	//If operation was successful it returns
	
	//$5 DocWithNoExtension_l- Optional Long Integer - (Default - 0 means Get rid of
	// doc without ext. on windows because it  kills the process, pass 1 to keep them
	
	//$6 ReduceDocto_l- Optional Long Integer - (Default 0 - all docs pass number to
	// reduce number of documents to that value
	//(like sometimes we want just last 2 docs modified most recently)
	
	//$0 as zero means no error
	//------------------ Revision Control ----------------
	//Date Created: 15/02/2010 12:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	ARRAY LONGINT:C221($_al_TimeDateStamp; 0)
	ARRAY TEXT:C222($_at_DocList; 0)
	ARRAY TEXT:C222($_at_Subdirectories; 0)
	C_BOOLEAN:C305($_bo_IncludeSubdirectories; $_bo_Invisible; $_bo_isWIndows; $_bo_Locked; $7; $_bo_HasDocFIleExtension; $_bo_IncludeSubdirectories; $_bo_Invisible; $_bo_isWIndows; $_bo_Locked; $7)
	C_DATE:C307($_d_ModifiedOn; $_d_CreatedOn; $_d_ModifiedOn)
	C_LONGINT:C283($_l_CurrDocTimeDateStamp; $_l_DocsWithNoExtension; $_l_DocumentOptions; $_l_Index; $_l_Index2; $_l_LimitSIze; $_l_SortBy; $0; $3; $4; $6)
	C_LONGINT:C283($_l_CountParameters; $_l_CurrDocTimeDateStamp; $_l_DocsWithNoExtension; $_l_DocumentOptions; $_l_Index; $_l_Index2; $_l_LimitSIze; $_l_SortBy; $3; $4; $5)
	C_LONGINT:C283($6)
	C_POINTER:C301($2; $_ptr_DocArray; $2)
	C_TEXT:C284($_t_LastCharacter; $_t_LocalDocument; $_t_oldMethodName; $1; $_t_DocumentFolderPath; $_t_LastCharacter; $_t_LocalDocument; $_t_oldMethodName; $1)
	C_TIME:C306($_ti_ModifiedAt; $_ti_CreatedAt; $_ti_ModifiedAt)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DocumentList")
If (False:C215)
	
End if 


$_l_CountParameters:=Count parameters:C259

$_t_DocumentFolderPath:=$1
$_ptr_DocArray:=$2

ARRAY TEXT:C222($_ptr_DocArray->; 0)

$0:=0  //Assume No errors

If ($_l_CountParameters>2)
	$_l_SortBy:=$3
Else 
	$_l_SortBy:=0
End if 

If ($_l_CountParameters>3)
	$_l_DocumentOptions:=$4
Else 
	$_l_DocumentOptions:=0
End if 

If ($_l_CountParameters>4)
	$_l_DocsWithNoExtension:=$5
Else 
	$_l_DocsWithNoExtension:=0
End if 

If ($_l_CountParameters>5)
	$_l_LimitSIze:=$6
Else 
	$_l_LimitSIze:=0
End if 
If (Count parameters:C259>=7)  //Additional parameter included NG october 2008 include subdirectories
	$_bo_IncludeSubdirectories:=$7
Else 
	$_bo_IncludeSubdirectories:=False:C215
End if 

$_bo_isWIndows:=Is Windows:C1573
//Folder separator:=DB_DirSymbol 

If (Test path name:C476($_t_DocumentFolderPath)=Is a folder:K24:2)
	ARRAY TEXT:C222($_at_Subdirectories; 0)
	ARRAY TEXT:C222($_at_DocList; 0)
	DOCUMENT LIST:C474($_t_DocumentFolderPath; $_at_DocList)
	If ($_bo_IncludeSubdirectories)
		FOLDER LIST:C473($_t_DocumentFolderPath; $_at_Subdirectories)
		For ($_l_Index; 1; Size of array:C274($_at_Subdirectories))
			APPEND TO ARRAY:C911($_at_DocList; $_at_Subdirectories{$_l_Index})
		End for 
	End if 
	ARRAY LONGINT:C221($_al_TimeDateStamp; Size of array:C274($_at_DocList))
	
	For ($_l_Index2; Size of array:C274($_at_DocList); 1; -1)
		If (Test path name:C476($_t_DocumentFolderPath+Folder separator:K24:12+$_at_DocList{$_l_Index2})#Is a folder:K24:2)
			$_bo_HasDocFIleExtension:=Position:C15("."; $_at_DocList{$_l_Index2})>0
			$_l_CurrDocTimeDateStamp:=0
			If (($_l_DocsWithNoExtension=0) & ($_bo_isWIndows) & (Not:C34($_bo_HasDocFIleExtension)))  //If PC get rid of files without extensions it casues problems
				DELETE FROM ARRAY:C228($_at_DocList; $_l_Index2)
				DELETE FROM ARRAY:C228($_al_TimeDateStamp; $_l_Index2)
			Else 
				$_t_LastCharacter:=Substring:C12($_t_DocumentFolderPath; Length:C16($_t_DocumentFolderPath); 1)
				
				If ($_t_LastCharacter=Folder separator:K24:12)
					$_t_LocalDocument:=$_t_DocumentFolderPath+$_at_DocList{$_l_Index2}
				Else 
					$_t_LocalDocument:=$_t_DocumentFolderPath+Folder separator:K24:12+$_at_DocList{$_l_Index2}
				End if 
				
				GET DOCUMENT PROPERTIES:C477($_t_LocalDocument; $_bo_Locked; $_bo_Invisible; $_d_CreatedOn; $_ti_CreatedAt; $_d_ModifiedOn; $_ti_ModifiedAt)
				
				Case of 
					: (($_bo_Invisible) & (($_l_DocumentOptions=1) | ($_l_DocumentOptions=3)))
						DELETE FROM ARRAY:C228($_at_DocList; $_l_Index2)
						DELETE FROM ARRAY:C228($_al_TimeDateStamp; $_l_Index2)
						
					: (($_bo_Locked) & (($_l_DocumentOptions=2) | ($_l_DocumentOptions=3)))
						DELETE FROM ARRAY:C228($_at_DocList; $_l_Index2)
						DELETE FROM ARRAY:C228($_al_TimeDateStamp; $_l_Index2)
						
					: ($_l_SortBy=1)  //by default sort by created date and time
						
						If ($_d_CreatedOn#!00-00-00!)
							$_l_CurrDocTimeDateStamp:=BP_Timestamp($_d_CreatedOn; $_ti_CreatedAt)
						End if 
						$_al_TimeDateStamp{$_l_Index2}:=$_l_CurrDocTimeDateStamp
						
					: ($_l_SortBy=2)
						
						If ($_d_ModifiedOn#!00-00-00!)
							$_l_CurrDocTimeDateStamp:=BP_Timestamp($_d_ModifiedOn; $_ti_ModifiedAt)
						End if 
						$_al_TimeDateStamp{$_l_Index2}:=$_l_CurrDocTimeDateStamp
						
					Else 
						//by default sort by doc names so no need to do anything 4d does that
				End case 
				
			End if 
		End if 
	End for 
	
	If ($_l_SortBy=0)  //Sort by doc name - 4d does it already just copy array as it is
		
		COPY ARRAY:C226($_at_DocList; $_ptr_DocArray->)
		
	Else 
		
		SORT ARRAY:C229($_al_TimeDateStamp; $_at_DocList; <)  //Get last modified backup files on top in array
	End if 
	If ($_l_LimitSIze>0)
		If ($_l_LimitSIze<Size of array:C274($_at_DocList))  //NG October 2009 only reduce the size don't increase it!!!!...
			ARRAY TEXT:C222($_at_DocList; $_l_LimitSIze)
		End if 
	End if 
	
	COPY ARRAY:C226($_at_DocList; $_ptr_DocArray->)
	
	
	
End if 
ERR_MethodTrackerReturn("DocumentList"; $_t_oldMethodName)
