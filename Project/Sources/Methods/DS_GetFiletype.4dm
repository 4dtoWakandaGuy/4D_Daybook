//%attributes = {}
If (False:C215)
	//Project Method Name:      DS_GetFiletype
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 18:09
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($2; $3)
	C_TEXT:C284($_t_DocumentExtension; $_t_DocumentName; $_t_DocumentType; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DS_GetFiletype")

//Method DS_GetFileType
//NG March 2004
//Purpose. This method will return in Parameter 2 the 3 letter file extension of a file name
//into the variable at pointer($2) . If there is no 3 letter extension this will return the file type on a mac in the variable at pointer($3)
//it may return into both variables
//NOTE: $3 will always be blank on a PC
If (Count parameters:C259>=3)
	$2->:=""
	$3->:=""
	If ($1#"")
		If (Test path name:C476($1)=Is a document:K24:1)
			
			//$_t_DocumentType:=""
			//If (DB_Macintosh )  //it is a mac
			//$_t_DocumentType:=_o_Document type($1)
			//End if
			//If ($_t_DocumentType#"")
			//If (Character code($_t_DocumentType[[1]])=0)
			//$_t_DocumentType:=""
			//End if
			//End if
			$_t_DocumentName:=FileNamefromPath($1)
			$_t_DocumentExtension:=""
			If (Length:C16($_t_DocumentName)>4)
				If ($_t_DocumentName[[(Length:C16($_t_DocumentName)-3)]]=".")
					$_t_DocumentExtension:=Substring:C12($_t_DocumentName; Length:C16($_t_DocumentName)-2; Length:C16($_t_DocumentName))
				Else 
					If ($_t_DocumentName[[(Length:C16($_t_DocumentName)-4)]]=".")
						$_t_DocumentExtension:=Substring:C12($_t_DocumentName; Length:C16($_t_DocumentName)-3; Length:C16($_t_DocumentName))
					End if 
				End if 
				
				If ($_t_DocumentExtension#"")  //& ($_t_DocumentType="")
					
					If (Is macOS:C1572)
						Case of 
							: ($_t_DocumentExtension="JPG")
								$_t_DocumentType:="JPEG"
							: ($_t_DocumentExtension="TiF") | ($_t_DocumentType="TiFf")
								$_t_DocumentType:="TIFF"
							: ($_t_DocumentExtension="Gif")
								$_t_DocumentType:="GiFf"
						End case 
					End if 
					
				End if 
			End if 
			$2->:=$_t_DocumentExtension
			
			
		End if 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("DS_GetFiletype"; $_t_oldMethodName)