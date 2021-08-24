function appr(val, target, amount) 
{
	return (val > target ? max(val - amount, target) : min(val + amount, target));
}

function Sin(a)
{
	return sin((1 - a) * (pi * 2));
}

function Cos(a)
{
	return cos((1 - a) * (pi * 2));
}

function maybe()
{
	return rnd(1) < 0.5;
}

function rnd(val)
{
	return random(val);
}

function flr(val)
{
	return floor(val);
}


function Point(_X, _Y) constructor
{
	x = _X;
	y = _Y;
}

function Rectangle(_X, _Y, _Width, _Height) constructor
{
	x = _X;
	y = _Y;
	Width = _Width;
	Height = _Height;
}

function node(_x, _y, _size) constructor 
{
	x = _x;
	y = _y;
	size = _size;
}

function HashSet()
{
	var size = (argument_count > 0) ? argument[0] : 0;
	var _array = [size];
	for (var i = 0; i < size; i++){
		_array[i] = false;
	}
	return _array;
}

#region Vector 2
///@function Vector2( x, y)
///@argument x
///@argument y
function Vector2( _x, _y) constructor
{
    #region Declaration
    x = _x
    y = _y
    #endregion
    
    #region Functions
        
        ///@description Adds the provided vector to this one
        ///@function Add(Vector2)
        ///@argument {Vector2} vector2
        static Add = function( _other)
            {
            x += _other.x;
            y += _other.y;
            }
        
        ///@description Subtracts the provided vector from this one
        ///@function Subtract(Vector2)
        ///@argument {Vector2} vector2
        static Subtract = function( _other)
            {
            x -= _other.x;
            y -= _other.y;
            }
        
        ///@description Multiplying the provided vector with this one
        ///@function Multiply(Vector2)
        ///@argument {Vector2} vector2
        static Multiply = function( _other)
            {
            x *= _other.x;
            y *= _other.y;
            }
        
        ///@description Divides the vector by the provided one
        ///@function Divide(Vector2)
        ///@argument {Vector2} vector2
        static Divide = function( _other)
            {
            x /= _other.x;
            y /= _other.y;
            }
        
        static Distance = function( _other)
            {
            return sqrt(((_other.x - x)^2) + ((_other.y - y)^2))    
            }
        
    #endregion
    }
#endregion