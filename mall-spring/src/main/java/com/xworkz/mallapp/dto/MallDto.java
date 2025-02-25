
package com.xworkz.mallapp.dto;

import lombok.*;

import javax.persistence.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Entity
@Table(name = "mall_details")
@NamedQueries({
        @NamedQuery(name = "getOwnerNameById", query = "select mall.ownerName from MallDto mall where mall.shopId=:i"),
        @NamedQuery(name = "getShopNameAndLocationById", query = "select mall.shopName, mall.location from MallDto mall where mall.shopId=:i"),
        @NamedQuery(name = "getRevenueAndSizeByShopName", query = "select mall.revenue, mall.size from MallDto mall where mall.shopName=:name"),
        @NamedQuery(name = "updateShopNameById", query = "update MallDto mall set mall.shopName = :name where mall.shopId =:id"),
        @NamedQuery(name = "updateRevenueById", query = "update MallDto mall set mall.revenue = :rev where mall.shopId =:id"),
        @NamedQuery(name = "updateSizeByName", query = "update MallDto mall set mall.size = :size where mall.shopName =:name"),
        @NamedQuery(name = "removeShopByName", query = "delete from MallDto mall where mall.shopName =:name"),
        @NamedQuery(name = "getShops", query = "SELECT s FROM MallDto s")
})
public class MallDto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int shopId;

    @Column(name = "shopName")
    private String shopName;

    @Column(name = "ownerName")
    private String ownerName;

    @Column(name = "location")
    private String location;

    @Column(name = "revenue")
    private double revenue;

    @Column(name = "size")
    private double size;
}

