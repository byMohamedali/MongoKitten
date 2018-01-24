import Async
import BSON

extension Collection {
    public func find(
        _ filter: Query? = nil,
        sortedBy sort: Sort? = nil,
        projecting projection: Projection? = nil
    ) -> Cursor<C> {
        var find = Find(on: self)
        find.filter = filter
        find.sort = sort
        find.projection = projection
        
        return find.execute(on: self.connection)
    }
    
    public func find(
        _ filter: Query? = nil,
        in range: Range<Int>,
        sortedBy sort: Sort? = nil,
        projecting projection: Projection? = nil
    ) -> Cursor<C> {
        var find = Find(on: self)
        find.filter = filter
        find.sort = sort
        find.skip = range.lowerBound
        find.limit = range.upperBound - range.lowerBound
        find.projection = projection
        
        return find.execute(on: self.connection)
    }
    
    public func find(
        _ filter: Query? = nil,
        in range: ClosedRange<Int>,
        sortedBy sort: Sort? = nil,
        projecting projection: Projection? = nil
    ) -> Cursor<C> {
        var find = Find(on: self)
        find.filter = filter
        find.sort = sort
        find.skip = range.lowerBound
        find.limit = (range.upperBound + 1) - range.lowerBound
        find.projection = projection
        
        return find.execute(on: self.connection)
    }
    
    public func find(
        _ filter: Query? = nil,
        in range: PartialRangeFrom<Int>,
        sortedBy sort: Sort? = nil,
        projecting projection: Projection? = nil
    ) -> Cursor<C> {
        var find = Find(on: self)
        find.filter = filter
        find.sort = sort
        find.skip = range.lowerBound
        find.projection = projection
        
        return find.execute(on: self.connection)
    }
    
    public func find(
        _ filter: Query? = nil,
        in range: PartialRangeUpTo<Int>,
        sortedBy sort: Sort? = nil,
        projecting projection: Projection? = nil
    ) -> Cursor<C> {
        var find = Find(on: self)
        find.filter = filter
        find.sort = sort
        find.limit = range.upperBound
        find.projection = projection
        
        return find.execute(on: self.connection)
    }
    
    public func find(
        _ filter: Query? = nil,
        in range: PartialRangeThrough<Int>,
        sortedBy sort: Sort? = nil,
        projecting projection: Projection? = nil
    ) -> Cursor<C> {
        var find = Find(on: self)
        find.filter = filter
        find.sort = sort
        find.limit = range.upperBound + 1
        find.projection = projection
        
        return find.execute(on: self.connection)
    }
    
    public func findOne(
        _ filter: Query? = nil,
        sortedBy sort: Sort? = nil,
        projecting projection: Projection? = nil
    ) -> Future<Document?> {
        var findOne = FindOne(for: self)
        findOne.filter = filter
        findOne.sort = sort
        findOne.projection = projection
        
        return findOne.execute(on: self.connection)
    }
}