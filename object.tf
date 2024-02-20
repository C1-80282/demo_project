resource "aws_s3_object" "index"{
	bucket = "c1-80282-9"
	key = "index.html"
	source = "index.html"
	acl = "private"
	content_type = "text/html"

}

resource "aws_s3_object" "error" {
	bucket = "c1-80282-9"
	key = "error.html"
	source = "error.html"
	acl = "private"
	content_type = "text/html"
}

resource "aws_s3_object" "style" {
	bucket = "c1-80282-9"
	key = "style.css"
	source = "style.css"
	acl = "private"
	content_type = "text/css"
}


resource "aws_s3_object" "script" {
	bucket = "c1-80282-9"
	key = "script.js"
	source = "script.js"
	acl = "private"
	content_type = "text/javascript"
}

resource "aws_s3_bucket_website_configuration" "website" {
	bucket = "c1-80282-9"
	index_document {
		suffix = "index.html"
		}
	
	error_document {
		key = "error.html"
		}
	depends_on = [
		aws_s3_object.index,
		aws_s3_object.error,
		aws_s3_object.style,
		aws_s3_object.script
		]

}
