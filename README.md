
## DEMO-CHT # 166BUG

Reproduce the BUG described in [#174](https://github.com/chiahsien/CHTCollectionViewWaterfallLayout/issues/174).

### The main steps

In the `UICollectionViewWaterfallLayout.m -> - (void) prepareLayout`, set` `NSIndexPath indexPathForItem: 0 inSection: section]`

In the `UICollectionViewWaterfallLayout.m -> - (NSArray *) layoutAttributesForElementsInRect: (CGRect) rect`, using the` NSDictionary` as the storage structure, use `attr`` NSIndexPath` as the `NSDictionary` key

So, when `UICollectionViewWaterfallLayout.m -> - (NSArray *) layoutAttributesForElementsInRect: (CGRect) rect` need to return both` header` and `footer` 'will appear. That is, `value1` in` dict` will be replaced by `value2`.

```oc
NSMutableDictionary * dict = [NSMutableDictionary dictionary];
Dict [@ "KEY"] = @ "value1";
Dict [@ "KEY"] = @ "value2";
```

------

## DEMO-CHT#166BUG

重现[#174](https://github.com/chiahsien/CHTCollectionViewWaterfallLayout/issues/174)中所描述的BUG。

### 主要步骤

在 `UICollectionViewWaterfallLayout.m -> - (void)prepareLayout` 中，设置`header`、`footer`使用的`NSIndexPath`定义均为`[NSIndexPath indexPathForItem:0 inSection:section]`

在 `UICollectionViewWaterfallLayout.m -> - (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect`中，采用了`NSDictionary`作为存储结构，使用`attr`的`NSIndexPath`作为`NSDictionary`的key

所以，当`UICollectionViewWaterfallLayout.m -> - (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect`需要同时返回`header`和`footer`将会出现`header`被`footer`替换的现象。即：`dict`中的`value1`将被`value2`所替换。

``` oc
NSMutableDictionary *dict = [NSMutableDictionary dictionary];
dict[@"KEY"] = @"value1";
dict[@"KEY"] = @"value2";
```
