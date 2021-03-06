<#include "/admin/utils/ui.ftl"/>
<@layout>

<section class="content-header">
    <h1>主题管理</h1>
    <ol class="breadcrumb">
        <li><a href="${base}/admin">首页</a></li>
        <li class="active">主题管理</li>
    </ol>
</section>
<section class="content container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">主题设置</h3>
                </div>
                <div class="box-body">
                    <ul class="mailbox-attachments clearfix">
                        <#list themes as row>
                        <li>
                            <span class="mailbox-attachment-icon no-padding">
                                <img src="${row.previews[0]}" style="width: 100%; height: 132px;"/>
                            </span>
                            <div class="mailbox-attachment-info">
                                <a href="${row.website}" target="_blank" class="mailbox-attachment-name">
                                    <i class="fa fa-circle-o"></i> ${row.name}
                                </a>
                                <span class="mailbox-attachment-size">
                                    作者: ${row.author!'-'}
                                    <#if options['theme'] == row.name >
                                        <a href="javascript:;" class="pull-right">
                                            <i class="fa fa-lg fa-toggle-on"></i>
                                        </a>
                                    <#else>
                                        <a href="javascript:;" class="pull-right" data-action="toggle" data-value="${row.name}">
                                            <i class="fa fa-lg fa-toggle-off"></i>
                                        </a>
                                    </#if>
                                </span>
                            </div>
                        </li>
                        </#list>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<script type="text/javascript">
    $(function () {
        $('a[data-action="toggle"]').click(function () {
            var that = $(this);
            var value = that.data('value');
            $.getJSON('${base}/admin/theme/update', {'theme': value}, function (json) {
                layer.alert(json.message, function(){
                    location.reload();
                });
            })
        })
    })
</script>
</@layout>