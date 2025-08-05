class_name ScriptDraw2D

static func exec(sc :Array) -> Array:
	var rtn :Array = []
	for l in sc:
		exec_line(l, rtn)
	return rtn

static func exec_line(l:Array, dst :Array):
	match l[0]:
		"set" :
			dst.append(Vector2i(l[1],l[2]))
		"hline":
			add_hline(l[1],l[2],l[3], dst)
		"vline":
			add_vline(l[1],l[2],l[3], dst)
		"rect":
			add_rect(l[1],l[2],l[3],l[4], dst)
		"fill":
			add_fill(l[1],l[2],l[3],l[4], dst)
		_:
			assert(false, "invalid script line %s" %[l])

# include x2
static func add_hline(x1 :int, x2 :int, y :int, dst :Array):
	if x1 > x2 :
		var t = x1
		x1 = x2
		x2 = t
	for x in range(x1,x2+1):
		dst.append( Vector2i(x,y) )

# include y2
static func add_vline(x :int, y1 :int, y2 :int, dst :Array):
	if y1 > y2 :
		var t = y1
		y1 = y2
		y2 = t
	for y in range(y1,y2+1):
		dst.append( Vector2i(x,y) )

static func add_rect(x1 :int, x2 :int, y1 :int, y2 :int, dst :Array):
	add_hline(x1,x2-1, y1, dst)
	add_hline(x1+1,x2, y2, dst)
	add_vline(x1, y1+1,y2, dst)
	add_vline(x2, y1,y2-1, dst)

static func add_fill(x1 :int, x2 :int, y1 :int, y2 :int, dst :Array):
	for x in range(x1,x2+1):
		add_vline(x, y1,y2, dst)
